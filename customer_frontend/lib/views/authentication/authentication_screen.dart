import 'package:flutter/material.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';

class AuthenticationScreen extends StatelessWidget {
  static const String id = "auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter your account details to get started.",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            flex: 3,
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  children: [],
                )
              ],
            ),
            flex: 2,
          )
        ],
      ),
    ));
  }
}
