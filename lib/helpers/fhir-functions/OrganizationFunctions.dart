import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:medibound_flutter/helpers/fhir/Organization.dart';

class OrganizationFunctions {

  final String token;

  OrganizationFunctions({
    required this.token
  });
  Future<void> createOrganization(
    Organization organization
      ) async {
    final fhirServerUrl = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Organization');

    final organizationData = {
      'resourceType': 'Organization',
      'identifier': [
        {'value': organization.identifierValue}
      ],
      'type': [
        {
          'coding': [
            {'system': 'http://hl7.org/fhir/organization-type', 'code': organization.type}
          ]
        }
      ],
      'name': organization.name,
      'telecom': [
        {'system': organization.contactSystem, 'value': organization.contactValue, 'use': organization.contactUse}
      ]
    };

    print(organizationData);

    final response = await http.post(
      fhirServerUrl,
      headers: {
        'Content-Type': 'application/fhir+json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(organizationData),
    );

    if (response.statusCode == 200) {
      print('Organization data uploaded successfully.');
    } else {
      print('Error uploading FHIR data: ${response.body}');
    }
  }

  void test() async {
    if (token != null) {
      await createOrganization(Organization(
        identifierValue: "organ", 
        type: "prov", 
        name: "Acme Health", 
        contactSystem: 'email', 
        contactValue: 'support@acme.com', 
        contactUse: 'work',
        id: ""));
    }
  }
}
