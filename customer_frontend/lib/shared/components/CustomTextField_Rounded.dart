import 'package:flutter/material.dart';

class CustomTextFieldRounded extends StatelessWidget {
  String hintText;
  TextEditingController controller;

  CustomTextFieldRounded(this.hintText, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(12))),
    );
  }

}