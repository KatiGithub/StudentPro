import 'package:flutter/material.dart';
import 'package:studio_projects/constant/components.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'images/logo.png',
                    height: 120.0,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter school email',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 10.0),
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                keyboardType: TextInputType.name,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black45, width: 10.0),
                        borderRadius: BorderRadius.circular(40.0))),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
