import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class FormValidators {
  static String? emailValidator(String? input) {
    if (input == null || input.isEmpty) {
      return "Email can't be empty";
    } else if (!input.contains("@")) {
      return "Invalid Email Format";
    }
    return null;
  }

  static String? passwordValidator(String? input) {
    if (input == null || input.length < 8) {
      return "Password must be longer than 8 characters";
    }

    return null;
  }

  static String? schoolEmailValidator(String? input) {

  }
}
