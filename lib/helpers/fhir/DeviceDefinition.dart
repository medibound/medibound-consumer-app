import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';

class DeviceDefinition {
  String identifierValue;
  String deviceName;
  String organizationId;
  String deviceVersion;
  String description;
  String type;
  String transferType;
  String manualLink;
  String modelNumber;
  String note;
  List<String> images;
  List<String> runningStages;
  List<Map<String, String>> variables;

  //String observationDefinition;

  DeviceDefinition({
    required this.identifierValue,
    required this.deviceName,
    required this.organizationId,
    required this.deviceVersion,
    required this.description,
    required this.type,
    required this.transferType,
    required this.manualLink,
    required this.modelNumber,
    required this.note,
    required this.images,
    required this.runningStages,
    required this.variables,
    //required this.observationDefinition,
  });

  static DeviceDefinition decode(Map<String, dynamic> json) {
    return DeviceDefinition(
      identifierValue: json['identifierValue'] ?? '',
      deviceName: json['deviceName'] ?? '',
      organizationId: json['organizationId'] ?? '',
      deviceVersion: json['deviceVersion'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      transferType: json['transferType'] ?? '',
      manualLink: json['manualLink'] ?? '',
      modelNumber: json['modelNumber'] ?? '',
      note: json['note'] ?? '',
      images: (json['images'] as List).map((e) => e.toString(),).toList(),
      runningStages: (json['runningStages'] as List).map((e) => e.toString(),).toList(),
      variables: json['variables']
      //observationDefinition: /*json['observationDefinition']['reference'] ??'',
    );
  }

  static Future<DeviceDefinition> fetchDeviceDefinition(String definitionId, String token) async {
    final response = await FirebaseFunctions.instance.httpsCallable("getResource").call({
      'type': 'devicedefinition',
      'id': definitionId,
    });;

      final Map<String, dynamic> definitionJson = jsonDecode(response.data);
      return DeviceDefinition.decode(definitionJson);

  }
}
