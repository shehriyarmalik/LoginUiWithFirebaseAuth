import 'package:Login/models/user.dart';
import 'package:Login/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//auth for users registered hairdressers
class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

// create user with email and pass
  static void signUpUser(
      BuildContext context, String name, String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User signedInUser = authResult.user;
      //create storage collection of name email
      if (signedInUser != null) {
        _firestore.collection('/users').doc(signedInUser.uid).set({
          'name': name,
          'email': email,
        });
        Provider.of<UserModel>(context).currentUserId = signedInUser.uid;
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

//sign out
  static void logout() {
    _auth.signOut();
  }

// login with email and pass
  static void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }
  }
}
