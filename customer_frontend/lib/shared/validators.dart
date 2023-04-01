import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class FormValidators {
  static String? emailValidator(String? input) {
    if (input == null || input.isEmpty) {
      return "Email can't be empty";
    } else if (!input!.contains("@")) {
      return "Invalid Email Format";
    }

    // if (input.contains('@') &&
    //     input.substring(input.indexOf('@') + 1, input.length).length > 1) {
    //   String uniDomainName =
    //       input.substring(input.indexOf('@') + 1, input.length);
    //
    //   universityEmailValidator(uniDomainName).then((bool value) {
    //     print(value);
    //     if (!value) {
    //       return "Email not part of a supported university";
    //     }
    //   });
    // }

    return null;
  }

  static String? passwordValidator(String? input) {
    if (input == null || input.length < 8) {
      return "Password must be longer than 8 characters";
    }

    return null;
  }

  static Future<bool> universityEmailValidator(String domainName) async {
    return rootBundle.loadString('assets/universities.json').then((value) {
      List<Map<String, dynamic>> universities =
          List<Map<String, dynamic>>.from(jsonDecode(value));
      List<Map<String, List>> universitiesList = universities
          .map((element) => {
                'name': [element['name']],
                'domains': List<String>.from(element['domain'])
              })
          .toList();
      for (Map<String, List> university in universitiesList) {
        for (List domains in university.values) {
          if (domains.contains(domainName)) return true;
        }
      }
      return false;
    });
  }
}
