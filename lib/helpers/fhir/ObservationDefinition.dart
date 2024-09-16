import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';

class ObservationDefinition {
  String userId;
  String id;
  List<String> code;
  List<String> dataCode;
  List<String> colors;
  Map<String, dynamic>  category; // Updated to CodeableConcept
  String preferredReportName;
  List<String> permittedDataType;
  bool multipleResultsAllowed;
  List<MedicalUnit> units;
  List<Map<String, dynamic>> qualifiedInterval;
  Map<String, dynamic>  method;
  
  List<Map<String, dynamic>>? headerDefinition;

  ObservationDefinition({
    required this.userId,
    required this.id,
    required this.code,
    required this.dataCode,
    required this.colors,
    required this.category, // Updated to CodeableConcept
    required this.preferredReportName,
    required this.permittedDataType,
    required this.multipleResultsAllowed,
    required this.units,
    required this.qualifiedInterval,
    required this.method,
  }) {
    headerDefinition = [];

    print(qualifiedInterval);

    for(var i = 0; i < units.length; i++) {
      headerDefinition?.add({
        "unit": units[i],
        "size": qualifiedInterval[i]["system"],
        "display": qualifiedInterval[i]["display"],
        "type": qualifiedInterval[i]["code"],
        "dataType": permittedDataType[i],
        'code': code[i],
        'color': colors[i],
        "id": dataCode[i]
      });
    }
  }

  

  factory ObservationDefinition.fromJson(Map<String, dynamic> json) {
    return ObservationDefinition(
      userId: json['userId'] ?? '',
      id: json['id'] ?? '',
      dataCode: (json['identifier'] as List)
          .map((qi) => qi['value'].toString()).toList(),
      code: (json['code']['coding'] as List)
          .map((qi) => qi['code'].toString()).toList(),
      category: json['category'][0]['coding'][0] ?? {}, // Updated to CodeableConcept
      preferredReportName: json['preferredReportName'] ?? '',
      permittedDataType: List<String>.from(json['permittedDataType'] ?? []),
      multipleResultsAllowed: json['multipleResultsAllowed'] ?? false,
      units: (json['quantitativeDetails']['unit']['coding'] as List)
          .map((qi) => MedicalUnit.fromJson(qi['code']) ?? MedicalUnit.Unit)
          .toList(),
      qualifiedInterval: (json['qualifiedInterval'] as List)
          .map((qi) => Map<String, Object>.from({
            "code" : qi['extension'][0]['valueCodeableConcept']['coding'][0]['code'],
            "system" : (qi['extension'][0]['valueCodeableConcept']['coding'][0]['system'] as String).split("/")[0],
            "display" : qi['extension'][0]['valueCodeableConcept']['coding'][0]['display'],
          }))
          .toList(),
      colors: (json['qualifiedInterval'] as List)
          .map((qi) => (
           (qi['extension'][0]['valueCodeableConcept']['coding'][0]['system'] as String).split("/")[1]
          ))
          .toList(),
      method: Map<String, dynamic>.from(json['method']),
    );
  }

  Map<String, dynamic> toJson() {

    Map<String, dynamic> categoryJson = {
      'coding': [
        {
          'system':
              'http://terminology.hl7.org/CodeSystem/observation-category',
          'code': category['code'],
          'display': category['display']
        }
      ],
    };

    Map<String, dynamic> methodJson = {
      'coding': [
        {
          'system': 'http://snomed.info/sct',
          'code': method['code'],
          'display': method['display']
        }
      ],
    };

    Map<String, dynamic> codeJson = {
      'coding': (code as List).map((qi) => Map<String, Object>.from(
        {
          'system': 'http://loinc.org',
          'code': qi,
          'display': "Body temperature"
        }
      )).toList()
    };

    List<Map<String, dynamic>> dataCodeJson = (dataCode as List).map((qi) => Map<String, Object>.from(
        {
          'system': 'http://medibound.com/data-id',
          'value': qi,
        }
      )).toList();

    List<Map<String, dynamic>> qualifiedIntervalsJson = [];
    for (var i = 0; i < qualifiedInterval.length; i++) {
      qualifiedIntervalsJson.add({
        'category': qualifiedInterval[i]['category'],
        'extension': [
          {
            'url':
                'http://example.org/fhir/StructureDefinition/displayProperties',
            'valueCodeableConcept': {
              'coding': [
                {
                  'system': qualifiedInterval[i]['system'] + "/" + colors[i],
                  'code': qualifiedInterval[i]['code'],
                  'display': qualifiedInterval[i]['display']
                },
              ]
            }
          }
        ]
      });
    };

    

    return {
      'resourceType': 'ObservationDefinition',
      'id': id,
      'identifier': dataCodeJson,
      'code': codeJson,
      'category': [categoryJson],
      'preferredReportName': preferredReportName,
      'permittedDataType': permittedDataType,
      'multipleResultsAllowed': multipleResultsAllowed,
      'quantitativeDetails': {
        'unit': {
          "coding": 
              (units as List).map((q) => Map<String, dynamic>.from(
                {
                "system": "http://hl7.org/fhir/ValueSet/ucum-units",
                "code": q.code
                }
              )).toList()
        },
      },
      'qualifiedInterval': qualifiedIntervalsJson,
      'method': methodJson,
    };
  }

  static Future<ObservationDefinition> fetchObservationDefinition(
      String definitionId, String token) async {
    final url = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/ObservationDefinition/$definitionId');
    //print(url);
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> definitionJson = jsonDecode(response.body);
      return ObservationDefinition.fromJson(definitionJson);
    } else {
      throw Exception('Failed to load observation definition');
    }
  }
}
