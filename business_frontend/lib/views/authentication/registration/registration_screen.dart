import 'package:business_frontend/models/user.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {

  static const id = "registration";

  User existingUser;
  RegistrationScreen(this.existingUser);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(),
    );
  }
}