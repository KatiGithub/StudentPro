import 'package:flutter/material.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';

class AuthenticationScreen extends StatelessWidget {
  static const String id = "auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/logo.png',
                      height: 120.0,
                    )),
                RoundedButton(
                    title: "Log In",
                    colour: Colors.blueAccent,
                    onPressed: () {
                      print("Login Pressed");
                      Navigator.pushNamed(context, 'login');
                    }),
                RoundedButton(
                    title: "Register",
                    colour: Colors.blueAccent,
                    onPressed: () {
                      print("Register Pressed");
                      Navigator.pushNamed(context, 'registration');
                    })
              ],
            ),
          )),
    );
  }
}
