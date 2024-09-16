import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:medibound_flutter/helpers/GoogleCloudService.dart';
import 'package:palette_generator/palette_generator.dart';

class Organization {
  String identifierValue;
  String type;
  String name;
  String contactSystem;
  String contactValue;
  String contactUse;
  String id;

  String? pictureUrl;
  Color? color;

  Organization(
      {required this.identifierValue,
      required this.type,
      required this.name,
      required this.contactSystem,
      required this.contactValue,
      required this.contactUse,
      required this.id,
      this.pictureUrl});

  void setName(String name) {
    this.name = name;
  }

  Future<String> getProfilePicture(String id) async {
    try {
      // Reference to the image file in Firebase Storage
      final storageRef =
          FirebaseStorage.instance.ref().child('org_profile_pictures/$id.jpg');

      // Get the download URL
      String url = await storageRef.getDownloadURL();
      final paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(url),
      );
      String imageUrl = url;
      pictureUrl = url;
      color = paletteGenerator.dominantColor?.color;
      return imageUrl;
    } catch (e) {
      return "";
    }
  }

  static Organization decode(Map<String, dynamic> json) {
    return Organization(
        identifierValue: json['identifier'][0]['value'] ?? '',
        type: json['type'][0]['coding'][0]['code'] ?? '',
        name: json['name'] ?? '',
        contactSystem: json['telecom'][0]['system'] ?? '',
        contactValue: json['telecom'][0]['value'] ?? '',
        contactUse: json['telecom'][0]['use'] ?? '',
        id: json['id']);
  }

  static Future<Organization> fetchOrganization(
      String organizationId, String token) async {
    final url = Uri.parse(
        'https://healthcare.googleapis.com/v1/projects/medibound-420121/locations/us-east4/datasets/Medibound/fhirStores/Medibound-Test/fhir/Organization/$organizationId');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> organizationJson = jsonDecode(response.body);
      return Organization.decode(organizationJson);
    } else {
      throw Exception('Failed to load organization');
    }
  }

  
}
