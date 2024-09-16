import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/DeviceDefinition.dart';

class DeviceDefinitionFunctions {
  final String token;

  DeviceDefinitionFunctions({required this.token});

  Future<void> createDeviceDefinition(
      {required DeviceDefinition deviceDefinition}) async {
     final response = await FirebaseFunctions.instance.httpsCallable("createResource").call({
      'type': 'devicedefinition',
        'data': {
          'identifierValue': deviceDefinition.identifierValue,
          'deviceName': deviceDefinition.deviceName,
          'organizationId': deviceDefinition.organizationId,
          'deviceVersion': deviceDefinition.deviceVersion,
          'description': deviceDefinition.description,
          'type': deviceDefinition.type,
          'transferType': deviceDefinition.transferType,
          'manualLink': deviceDefinition.manualLink,
          'modelNumber': deviceDefinition.modelNumber,
          'note': deviceDefinition.note,
          'images': deviceDefinition.images,
          'runningStages': deviceDefinition.runningStages,
          'variables': deviceDefinition.variables
        },
      });

  

      print('DeviceDefinition data uploaded successfully.');

  }

  void test() async {
    if (token != null) {
      await createDeviceDefinition(
        deviceDefinition: DeviceDefinition(
          identifierValue: 'device12345',
          deviceName: 'High-Precision Thermometer',
          organizationId: '9933ec03-370c-44d3-b98b-20752f8b4a2a',
          deviceVersion: '1.0.0',
          description: "hello, My name is devce.",
          type: "W001",
          transferType: "LBLE",
          manualLink: "https:/docs.medibound.com/manual",
          modelNumber: "P10100",
          note: 'This device is calibrated annually.',
          images: [],
          runningStages: ["part1", "part2"],
          variables: [
            {
              "type": "ADEC",
              "code": "variable1",
              "display": "Variable 1"
            },
            {
              "type": "STRG",
              "code": "variable2",
              "display": "Variable 2"
            },
            {
              "type": "DECM",
              "code": "variable3",
              "display": "Variable 3"
            },
          ]
          //observationDefinition: "testDefiniton",
        ),
      );
    }
  }
}
