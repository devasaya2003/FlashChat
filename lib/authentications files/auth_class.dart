import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthClass {
  String email = "";
  String password = "";
  final _auth = FirebaseAuth.instance;
  Future<void> create_user(context, routeName) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      if (newUser != null) {
        Navigator.pushNamed(context, routeName);
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<void> sign_in(context, routeName) async {
    try {
      showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
      final newUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pop();
      if (newUser != null) {
        Navigator.pushNamed(context, routeName);
      }
    } catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }
}
