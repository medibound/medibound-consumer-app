import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';

class Patient {

  User user;
  String? id;
  String? familyName;
  List<String>? givenNames;
  String? email;
  String? gender;
  String? birthDate;
  String? pictureUrl;
  Color? color;

  Patient({
    required this.user,
  });

  Future<String> init(String token) async {
    final response = await FirebaseFunctions.instance.httpsCallable("getResource").call({
      'type': 'patient',
      'id': user.uid,
    });;


    final responseData = response.data;
    id = responseData['id'];
    familyName = responseData['familyName'];
    givenNames = (responseData['givenNames'] as List).map((e) => e.toString()).toList();
    email = responseData["email"];
    gender = responseData["gender"];
    birthDate = responseData['birthDate'];
    pictureUrl = responseData['pictureUrl'] ?? "";
    color = Color(int.parse("0xFF" + responseData['color'].toString().replaceFirst("#","").toUpperCase()));
    return responseData['id'];
  }
}