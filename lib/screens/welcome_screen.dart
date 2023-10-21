import 'package:flash_chat/custom%20buttons/login_register_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "/";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animation = ColorTween(
      begin: Colors.black, // Use .shade variant
      end: Colors.white, // Use .shade variant
    ).animate(controller!);

    controller!.forward();

    controller!.addListener(() {
      setState(() {});
      // print(animation!.value);
    });
  }

  @override
  void dispose() {
    
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation!.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      speed: Duration(milliseconds: 150),
                      textStyle: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            LogRegButton(
                text: "Login",
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color: Colors.lightBlueAccent,),
            LogRegButton(
              text: "Register",
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

