import 'package:flash_chat/authentications%20files/auth_class.dart';
import 'package:flash_chat/custom%20buttons/login_register_button.dart';
import 'package:flash_chat/custom%20buttons/user_cred_field.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "/login";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  final auth = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            UserCredentialField(
              obscureText: false,
              hint: "Enter your email...",
              color: Colors.lightBlueAccent,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 8.0,
            ),
            UserCredentialField(
              obscureText: true,
              hint: "Enter your password...",
              color: Colors.lightBlueAccent,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            LogRegButton(
                text: "Login",
                onPressed: () async{
                  
                  print(email);
                  print(password);
                  auth.email = email;
                  auth.password = password;
                  await auth.sign_in(context, ChatScreen.id);
                  
                },
                color: Colors.lightBlueAccent),
          ],
        ),
      ),
    );
  }
}
