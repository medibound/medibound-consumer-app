import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  Future<User?> createUser(
    String email,
    String password,
    String firstName,
    String lastName,
    String middleName,
    String gender,
    DateTime birthdate,
    Uint8List imageData,
  ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final birthdateString = birthdate.toIso8601String().split('T').first;
        final response = await FirebaseFunctions.instance.httpsCallable("createResource").call(<String, dynamic>{
          
          'data': {
            'identifier': result.user!.uid,
            'familyName': lastName,
            'givenNames': [firstName, middleName],
            'email': email,
            'gender': gender.toLowerCase(),
            'birthDate': birthdateString
          },
          'type': 'patient',
          'imageData': imageData
        });
      

      print(response.data);

      await result.user!.updatePhotoURL(response.data['pictureUrl']);

      return result.user;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }
/*'identifier': result.user!.uid,
          'familyName': lastName,
          'givenNames': [firstName, middleName],
          'email': email,
          'gender': gender,
          'birthDate': birthdate,*/
  

  
}
