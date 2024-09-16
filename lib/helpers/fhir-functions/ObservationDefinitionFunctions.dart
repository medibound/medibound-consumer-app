import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/ObservationDefinition.dart';
import 'package:medibound_flutter/res/MedicalUnit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ObservationDefinitionFunctions {
  final String token;

  ObservationDefinitionFunctions({required this.token});

  Future<void> createObservationDefinition(
      ObservationDefinition observationDefinition) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/ObservationDefinition');
    //print(observationDefinition.method['coding'][0]['code']);
    final observationDefinitionData = observationDefinition.toJson();

    print(observationDefinitionData);

    final response = await http.post(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(observationDefinitionData),
    );

    if (response.statusCode == 200) {
      print('ObservationDefinition data uploaded successfully.');
    } else {
      print('Error uploading FHIR data: ${response.body}');
    }
  }

  void test() async {
    final userId = 'user-123';
    final id = 'example-observationdefinition-layout';
    final code = ['8310-5', '8310-5', '8310-5'];
    final dataCode = ['weight-1', 'weight-2', 'weight-3'];
    final colors = ['blue', 'blue', 'purple'];
    final preferredReportName = 'Example Observation';
    final permittedDataType = ['Quantity', 'Quantity','SampledData'];
    final multipleResultsAllowed = true;
    final units = [MedicalUnit.Kilogram, MedicalUnit.Kilogram, MedicalUnit.Kilogram];

    final extensions = [
      {'system': 'one-block', 'code': 'basic', 'display': 'Weight', 'category': 'reference'},
      {'system': 'one-block', 'code': 'basic', 'display': 'Weight', 'category': 'reference'},
      {'system': 'two-block', 'code': 'line-graph', 'display': 'Weight', 'category': 'reference'}
    ];
    final qualifiedIntervals = <Map<String, dynamic>>[];

    for (var i = 0; i < extensions.length; i++) {
      qualifiedIntervals.add(
        extensions[i]
      );
    }
    final Map<String, Object> method = {
          'code': 'method-code',
          'display': 'Measurement Method'
    };

    final Map<String, dynamic> category = {
      
          'code': 'vital-signs',
          'display': 'Vital Signs'
    };

    await createObservationDefinition(ObservationDefinition(
        userId: userId,
        id: id,
        code: code,
        dataCode: dataCode,
        colors: colors,
        category: category,
        preferredReportName: preferredReportName,
        permittedDataType: permittedDataType,
        multipleResultsAllowed: multipleResultsAllowed,
        units: units,
        qualifiedInterval: qualifiedIntervals,
        method: method));
  }
}
