import 'package:flash_chat_app/components/rounded_button.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        ColorTween(begin: Colors.blue, end: Colors.green).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Hero(
                tag: 'logo',
                child: Container(
                  height: 60.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Flash Chat',
                    speed: Duration(milliseconds: 300),
                    textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    ),
              ),
                  ],
              ),
            ]),
            SizedBox(height: 45.0),
            RoundedButton(buttonText: 'Log In', buttonColor: Colors.lightBlueAccent, onPress: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },),
            RoundedButton(buttonText: 'Register', buttonColor: Colors.blueAccent, onPress: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            },),
          ],
        ));
  }
}


