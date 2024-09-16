import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Observation.dart';

class ObservationFunctions {
  final String token;

  ObservationFunctions({required this.token});

  Future<void> createObservation(Observation observation) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Observation');
    
    final response = await http.post(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(observation.toJson()),
    );

    if (response.statusCode == 200) {
      print('Observation uploaded successfully.');
    } else {
      print('Error uploading Observation: ${response.body}');
    }
  }

  Future<List<Observation>> listObservationsForPatient({
    required String patientReference,
  }) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Observation?subject=$patientReference');

    final response = await http.get(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['entry'] == null) {
        return [];
      }
      final List<dynamic> observationsJson = jsonDecode(response.body)['entry'];
      List<Observation> observations = observationsJson.map((observationJson) {
        final resource = observationJson['resource'];
        print(resource);
        final observation = Observation.decode(resource);

        return observation;
      }).toList();
      await Future.wait(observations.map((observation) => observation.init(token)));
      return observations;
    } else {
      print('Error fetching devices: ${response.body}');
      return [];
    }
  }

  Future<List<Observation>> listObservationsForPatientAndDevice({
    required String patientReference,
    required String deviceReference,
  }) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Observation?subject=$patientReference&device=$deviceReference');

    final response = await http.get(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
    );


    if (response.statusCode == 200) {
      if (jsonDecode(response.body)['entry'] == null) {
        return [];
      }
      final List<dynamic> observationsJson = jsonDecode(response.body)['entry'];
      List<Observation> observations = observationsJson.map((observationJson) {
        final resource = observationJson['resource'];
        print(resource);
        final observation = Observation.decode(resource);

        return observation;
      }).toList();
      await Future.wait(observations.map((observation) => observation.init(token)));
      return observations;
    } else {
      print('Error fetching devices: ${response.body}');
      return [];
    }
  }

  void test() async {
    final status = 'final';



    final effectiveDateTime = '2024-05-28T12:00:00Z';


    final observation = Observation(
      status: status,
      patientId: "dbe6913f-266d-4813-a289-917bc52af7e3",
      effectiveDateTime: effectiveDateTime,
      observationDefinitionId: 'e36355db-aed2-4f33-9c41-2b5ecd6c37c5',
      deviceId: 'ce9270e1-9896-44ef-98de-bfd1294c7ead',
      component: [84, 32, [25, 55, 35, 67, 89, 34, 78]],
    );

    

    // Fetch and print ObservationDefinition details
    final observationDefinition = await observation.init(token);
    await createObservation(observation);
    print('ObservationDefinition: ${observation.deviceDefinition!.deviceName}');
  }
}