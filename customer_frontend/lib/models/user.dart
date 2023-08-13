import 'dart:convert';

import 'package:studio_projects/models/university.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class User implements JsonSerializable {
  int? _userId;
  String? _firstName;
  String? _lastName;
  String? _personalEmail;
  double? _dateOfBirth;
  University? _university;
  String? _schoolEmail;
  String? _firebaseUserId;

  User();

  bool isFilledOut() {
    if (this._userId != '' &&
        this._firstName != '' &&
        this._lastName != '' &&
        this._personalEmail != '' &&
        this._dateOfBirth != 0 &&
        this._schoolEmail != '') {
      return true;
    }
    return false;
  }

  @override
  static User toClass(Map<String, dynamic> json) {


    User user = User();
    user.userId = json['userId'];
    user.firstName = json['firstName'] ?? '';
    user.lastName = json['lastName'] ?? '';
    user.personalEmail = json['personalEmail'] ?? '';
    user.dateOfBirth = json['dateOfBirth'] ?? 0;
    user.university =  json['University'] != null ? University.toClass(json['University']) : University(0, '', '');
    user.schoolEmail = json['schoolEmail'] ?? '';

    return user;
  }

  @override
  String toJson() {
    Map<String, dynamic> data = {};

    data['userId'] = _userId;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['personalEmail'] = _personalEmail;
    data['schoolEmail'] = _schoolEmail;
    data['dateOfBirth'] = _dateOfBirth;
    data['university'] = _university?.toJson();
    data['firebaseUserId'] = _firebaseUserId;

    return jsonEncode(data);
  }

  int? get userId => _userId;

  set userId(int? value) {
    _userId = value;
  }

  String? get firstName => _firstName;

  set firstName(String? value) {
    _firstName = value;
  }

  String? get lastName => _lastName;

  set lastName(String? value) {
    _lastName = value;
  }

  String? get personalEmail => _personalEmail;

  set personalEmail(String? value) {
    _personalEmail = value;
  }

  double? get dateOfBirth => _dateOfBirth;

  set dateOfBirth(double? value) {
    _dateOfBirth = value;
  }

  University? get university => _university;

  set university(University? value) {
    _university = value;
  }

  String? get schoolEmail => _schoolEmail;

  set schoolEmail(String? value) {
    _schoolEmail = value;
  }
  String? get firebaseUserId => _firebaseUserId;

  set firebaseUserId(String? value) {
    _firebaseUserId = value;
  }
}
