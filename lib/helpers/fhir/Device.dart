import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/AuthService.dart';
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/DeviceDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/ObservationDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/Organization.dart';

class Device {
  String identifierSystem;
  String identifierValue;
  String displayName;
  String definitionReference;
  String status;
  String serialNumber;
  String modelNumber;
  String partNumber;
  String patientReference;
  String id;
  Map<String, dynamic> property;

  ObservationDefinition? observationDefinition;
  DeviceDefinition? deviceDefiniton;
  Organization? owner;


  Device({
    required this.identifierSystem,
    required this.identifierValue,
    required this.displayName,
    required this.definitionReference,
    required this.status,
    required this.serialNumber,
    required this.modelNumber,
    required this.partNumber,
    required this.patientReference,
    required this.property,
    required this.id,
    this.observationDefinition,
    this.owner
  }) ;

  void setStatus(String status) {
    this.status = status;
  }

  void setPatient(String patient) {
    this.patientReference = patient;
  }

  void setDisplayName(String name) {
    this.displayName = name;
  }

  void setProperty(Map<String, dynamic>  property) {
    this.property = property;
  }

  void removePatient() {
    this.patientReference = '';
  }

  Future<void> update(String token) async {
    final url = Uri.parse('https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Device/$id');
    
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/fhir+json',
      },
      body: jsonEncode(toJson()),
    );

    
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': [
        {
          'system': identifierSystem,
          'value': identifierValue,
        }
      ],
      'deviceName': [
        {
          'name': displayName,
          'type': 'patient-reported-name'
        }
      ],
      'definition': {
        'reference': definitionReference,
      },
      'resourceType': "Device",
      'status': status,
      'serialNumber': serialNumber,
      'modelNumber': modelNumber,
      'partNumber': partNumber,
      'patient': patientReference.isNotEmpty ? {
        'reference': patientReference,
      } : null,
      'property': [property],
      'id': id,
    }..removeWhere((key, value) => value == null); // Remove null fields
  }

  Future<void> init(String token) async {
    await getOrganization(token);
    await getDeviceDefiniton(token);
    await owner!.getProfilePicture(owner!.id);
  }

  Future<DeviceDefinition> getDeviceDefiniton(String token) async {
    List<String> splitDef = definitionReference.split('/');
    String def = splitDef[1];

    DeviceDefinition deviceDefinitionLocal = await DeviceDefinition.fetchDeviceDefinition(def, token);
    deviceDefiniton = deviceDefinitionLocal;
    return deviceDefinitionLocal;
  }

  /*void getObservationDefiniton(String token) async {
    DeviceDefinition deviceDefinition = await getDeviceDefiniton(token);

    List<String> splitDef = deviceDefinition.observationDefinition.split('/');
    String def = splitDef[1];
    observationDefinition = await ObservationDefinition.fetchObservationDefinition(def, token);
  }*/

  Future<Organization> getOrganization(String token) async {
    AuthService authService = AuthService();
    DeviceDefinition deviceDefinition = await getDeviceDefiniton(token);

    String def = deviceDefinition.organizationId;
    Organization organization = await Organization.fetchOrganization(def, token);
    owner = organization;
    return organization;
  }


  static Device decode(Map<String, dynamic> json) {
    return Device(
      identifierSystem: json['identifier'][0]['system'] ?? '',
      identifierValue: json['identifier'][0]['value'] ?? '',
      displayName: json['deviceName'] != null && json['deviceName'].isNotEmpty
          ? json['deviceName'][0]['name']
          : '',
      definitionReference: json['definition']['reference'] ?? '',
      status: json['status'] ?? '',
      serialNumber: json['serialNumber'] ?? '',
      modelNumber: json['modelNumber'] ?? '',
      partNumber: json['partNumber'] ?? '',
      patientReference: json['patient']['reference'] ?? '',
      property: json['property'] != null
          ? Map<String, dynamic>.from(json['property'][0])
          : {},
      id: json['id'] ?? '',
    );
  }

  static Future<Device> fetchDevice(String deviceId, String token) async {
    final url = Uri.parse('https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Device/$deviceId');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> deviceJson = jsonDecode(response.body);
      return Device.decode(deviceJson);
    } else {
      throw Exception('Failed to load device');
    }
  }

}

class DeviceNotifier extends ValueNotifier<Device> {
  DeviceNotifier(Device value) : super(value);

  @override
  void setStatus(String status) {
    value.setStatus(status);
    notifyListeners();
  }

  @override
  void setPatient(String patient) {
    value.setPatient(patient);
    notifyListeners();
  }

  @override
  void setDisplayName(String name) {
    value.setDisplayName(name);
    notifyListeners();
  }

  @override
  void setProperty(Map<String, dynamic>  property) {
    value.setProperty(property);
    notifyListeners();
  }

  @override
  Future<void> removePatient(String token) async {
    value.removePatient();
    await update(token);
    notifyListeners();
    
  }

  @override
  Future<void> update(String token) async {
    final url = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Device/${value.id}');
    
    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/fhir+json',
      },
      body: jsonEncode(value.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update device');
    }

    
  }

}
