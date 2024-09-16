import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Device.dart';
import 'package:medibound_flutter/helpers/fhir/DeviceDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/ObservationDefinition.dart';
import 'package:medibound_flutter/helpers/fhir/Organization.dart';

class DeviceFunctions {
  final String token;

  DeviceFunctions({required this.token});

  Future<DeviceDefinition> getDeviceDefiniton(Device device) async {
    List<String> splitDef = device.definitionReference.split('/');
    String def = splitDef[1];
    
    return await DeviceDefinition.fetchDeviceDefinition(def, token);
  }

  /*Future<ObservationDefinition> getObservationDefiniton(Device device) async {
    DeviceDefinition deviceDefinition = await getDeviceDefiniton(device);

    List<String> splitDef = deviceDefinition.observationDefinition.split('/');
    String def = splitDef[1];
    return await ObservationDefinition.fetchObservationDefinition(def, token);
  }*/

  Future<Organization> getOrganization(Device device) async {
    DeviceDefinition deviceDefinition = await getDeviceDefiniton(device);

    String def = deviceDefinition.organizationId;
    return await Organization.fetchOrganization(def, token);
  }

  Future<void> createDevice({required Device device}) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Device');

    final deviceData = {
      'resourceType': 'Device',
      'identifier': [
        {'system': device.identifierSystem, 'value': device.identifierValue}
      ],
      'deviceName': [
        {'name': device.displayName, 'type': "patient-reported-name"}
      ],
      'definition': {'reference': device.definitionReference},
      'status': device.status,
      'serialNumber': device.serialNumber,
      'modelNumber': device.modelNumber,
      'partNumber': device.partNumber,
      'patient': {'reference': device.patientReference},
      'property': [device.property],
    };

    print(deviceData);

    final response = await http.post(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(deviceData),
    );

    if (response.statusCode == 200) {
      print('Device data uploaded successfully.');
    } else {
      print('Error uploading FHIR data: ${response.body}');
    }
  }

  Future<List<Device>> listDevicesForPatient({
    required String patientReference,
  }) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Device?patient=$patientReference');

    final response = await http.get(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
      final List<dynamic> devicesJson = jsonDecode(response.body)['entry'];
      List<Device> devices = devicesJson.map((deviceJson)  {
        final resource = deviceJson['resource'];
        final device = Device.decode(resource);

        return device;
      }).toList();
      await Future.wait(devices.map((device) => device.init(token)));
      return devices;
    } else {
      print('Error fetching devices: ${response.body}');
      return [];
    }
  }

  void test() async {
    if (token != null) {
      await createDevice(
        device: Device(
          identifierSystem: 'https://example.com/device/identifiers',
          identifierValue: 'device12345',
          displayName: 'High-Precision Thermometer',
          definitionReference:
              'DeviceDefinition/b4958cfb-c5db-42ab-afce-21a974342d36',
          status: 'inactive',
          serialNumber: 'SN123456',
          modelNumber: 'ModelX',
          partNumber: 'Part123',
          patientReference: 'Patient/dbe6913f-266d-4813-a289-917bc52af7e3',
          property: {
            'type': {
              'coding': [
                {'system': 'http://example.com', 'code': 'precision'}
              ]
            },
            'valueQuantity': [
              {'value': 0.1, 'unit': '°C'}
            ]
          },
          id: ""
        ),
      );
    }
  }
}
