import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Device.dart';
import 'package:medibound_flutter/helpers/fhir/DeviceDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/ObservationDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/Organization.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';

class Observation {
  final String resourceType = "Observation";
  final String status;
  final String effectiveDateTime;
  Map<String, dynamic>? code;
  final String observationDefinitionId;
  final String patientId;
  final String deviceId;
  final List<dynamic>? component;

  List<Map<String, dynamic>>? header;
  Device? device;
  DeviceDefinition? deviceDefinition;
  Organization? organization;
  ObservationDefinition? observationDefinition;

  Observation(
      {required this.status,
      required this.patientId,
      required this.effectiveDateTime,
      required this.observationDefinitionId,
      required this.deviceId,
      this.component,
      this.header,
      this.code});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'resourceType': resourceType,
      'status': status,
      'effectiveDateTime': effectiveDateTime,
    };

    if (patientId != null) {
      json['subject'] = {
        'reference': 'Patient/$patientId',
      };
    }

    code = observationDefinition!.toJson()["code"];

    if (code != null) {
      json['code'] = code;
    }

    if (observationDefinitionId != null) {
      json['focus'] = [
        {
          'reference': 'ObservationDefinition/$observationDefinitionId',
        }
      ];
    }

    if (deviceId != null) {
      json['device'] = {
        'reference': 'Device/$deviceId',
      };
    }

    if (component != null && component!.isNotEmpty) {
      List<Map<String, dynamic>> componentFinal = [];

      for (var i = 0; i < header!.length; i++) {
        if (header![i]['dataType'] == "Quantity") {
          componentFinal.add({
            'code': {
              'coding': [
                {
                  'system': 'http://loinc.org',
                  'code': header![i]['code'],
                  'display': 'Body Temperature'
                }
              ]
            },
            'valueQuantity': {
              'value': component![i],
              'unit': (header![i]['unit'] as MedicalUnit).abbreviation,
              'code': (header![i]['unit'] as MedicalUnit).code,
              'system': "http://hl7.org/fhir/ValueSet/ucum-units"
            }
          });
        } else if (header![i]['dataType'] == "SampledData") {
          
          String dataList = "";
          for (var j = 0; j < (component![i] as List).length; j++) {
            dataList += (component![i][j]).toString();
              dataList += " ";
          }
          dataList = dataList.trimRight();
          print(dataList);
          componentFinal.add({
            'code': {
              'coding': [
                {
                  'system': 'http://loinc.org',
                  'code': header![i]['code'],
                  'display': 'Body Temperature'
                }
              ]
            },
            'valueSampledData': {
              "origin": {
                'value': 0,
                'unit': (header![i]['unit'] as MedicalUnit).abbreviation,
                'code': (header![i]['unit'] as MedicalUnit).code,
                'system': "http://hl7.org/fhir/ValueSet/ucum-units"
              },
              'period': 1,
              'dimensions': 1,
              "data": dataList
            }
          });
        }
      }

      json['component'] = componentFinal;
    }

    return json;
  }

  Future<void> init(String token) async {
    await getObservationDefinition(token);
    await getOrganizationAndDevice(token);
    await device!.owner!.getProfilePicture(device!.owner!.id);
  }

  Future<Device> getOrganizationAndDevice(String token) async {
    if (deviceId == null) {
      throw Exception('DeviceId is not set');
    }
    Device deviceFinal = await Device.fetchDevice(deviceId!, token);
    DeviceDefinition deviceDefinitionFinal =
        await deviceFinal.getDeviceDefiniton(token);
    
    Organization organizationFinal = await deviceFinal.getOrganization(token);

    device = deviceFinal;
    deviceDefinition = deviceDefinitionFinal;
    organization = organizationFinal;

    return deviceFinal;
  }

  Future<ObservationDefinition> getObservationDefinition(String token) async {
    if (observationDefinitionId == null) {
      throw Exception('ObservationDefinitionId is not set');
    }
    ObservationDefinition observationDefinitionFinal =
        await ObservationDefinition.fetchObservationDefinition(
            observationDefinitionId!, token);

    List<Map<String, dynamic>> headerDef =
        observationDefinitionFinal.headerDefinition ?? [];
    List<Map<String, dynamic>> headerFinal = [];

    for (var i = 0; i < headerDef.length; i++) {

      headerFinal.add({
        "unit": headerDef[i]["unit"],
        "size": headerDef[i]["size"],
        "display": headerDef[i]["display"],
        "type": headerDef[i]["type"],
        "dataType": headerDef[i]["dataType"],
        "code": headerDef[i]['code'],
        "color": headerDef[i]['color'],
        "data": component![i],
        "id": headerDef[i]['id']
      });
    }

    header = headerFinal;
    observationDefinition = observationDefinitionFinal;

    return observationDefinitionFinal;
  }

  static Future<Observation> fetchObservation(
      String observationId, String token) async {
    final url = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Observation/$observationId');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> observationJson = jsonDecode(response.body);
      return decode(observationJson);
    } else {
      throw Exception('Failed to load observation');
    }
  }

  static Observation decode(Map<String, dynamic> json) {
    return Observation(
      status: json['status'],
      patientId: json['subject']['reference'].split('/').last,
      effectiveDateTime: json['effectiveDateTime'],
      observationDefinitionId: json['focus'][0]['reference'].split('/').last,
      deviceId: json['device']['reference'].split('/').last,
      component: json['component']?.map((comp) {
        if (comp['valueQuantity'] != null) {
          return double.parse((comp['valueQuantity']['value']).toString());
        } else if (comp['valueSampledData'] != null) {
          return comp['valueSampledData']['data']
              .split(' ')
              .map((e) => double.parse(e.toString()))
              .toList().cast<num>();
        } else {
          return null;
        }
      })?.toList(),
    );
  }
}

class ObservationNotifier extends ValueNotifier<Observation> {
  ObservationNotifier(Observation value) : super(value);
}
