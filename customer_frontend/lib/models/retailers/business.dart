import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/retailers/business_post.dart';
import 'package:studio_projects/models/translation.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class Business implements JsonSerializable {
  int _id;
  String _name;
  String _email;
  String _contactName;
  List<Translation> _businessInfo;
  List<Translation> _businessSlogan;

  Business(this._id, this._name, this._email, this._contactName, this._businessInfo, this._businessSlogan);

  int get businessId => _id;

  set businessId(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get contactName => _contactName;

  set contactName(String value) {
    _contactName = value;
  }

  List<Translation> get businessInfo => _businessInfo;

  set businessInfo(List<Translation> value) {
    _businessInfo = value;
  }

  List<Translation> get businessSLogan => _businessSlogan;

  set businessSLogan(List<Translation> value) {
    _businessSlogan = value;
  }

  @override
  static Business toClass(Map<String, dynamic> json) {
    List<Map<String, dynamic>> businessInfo = json['businessInfo'];
    List<Map<String, dynamic>> businessSlogan = json['businessSlogan'];

    return Business(
        json['id'],
        json['name'],
        json['email'],
        json['contactName'],
        businessInfo.map((e) => Translation.toClass(e)).toList(),
        businessSlogan.map((e) => Translation.toClass(e)).toList());
  }

  @override
  String toJson() {
    Map<String, dynamic> data = {};

    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['contactName'] = _contactName;
    data['businessInfo'] = _businessInfo;
    data['businessSlogan'] = _businessSlogan;

    return data.toString();
  }
}
