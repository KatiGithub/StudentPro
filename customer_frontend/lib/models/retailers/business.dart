import 'package:studio_projects/models/translation.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class Business implements JsonSerializable {
  int _id;
  List<Translation> _name;
  String _email;
  List<Translation> _businessInfo;
  List<Translation> _businessSlogan;

  Business(this._id, this._name, this._email, this._businessInfo, this._businessSlogan);

  int get businessId => _id;

  set businessId(int value) {
    _id = value;
  }

  List<Translation> get name => _name;

  set name(List<Translation> value) {
    _name = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  List<Translation> get businessInfo => _businessInfo;

  set businessInfo(List<Translation> value) {
    _businessInfo = value;
  }

  List<Translation> get businessSlogan => _businessSlogan;

  set businessSlogan(List<Translation> value) {
    _businessSlogan = value;
  }

  @override
  static Business toClass(Map<String, dynamic> json) {
    List<dynamic> businessInfo = json['businessInfo']["translations"];
    List<dynamic> businessSlogan = json['businessSlogan']["translations"];
    List<dynamic> businessName = json['name']["translations"];

    return Business(
        json['id'],
        businessName.map((dynamic e) => Translation.toClass(e as Map<String, dynamic>)).toList(),
        json['email'],
        businessInfo.map((e) => Translation.toClass(e)).toList(),
        businessSlogan.map((e) => Translation.toClass(e)).toList());
  }

  @override
  String toJson() {
    Map<String, dynamic> data = {};

    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['businessInfo'] = _businessInfo;
    data['businessSlogan'] = _businessSlogan;

    return data.toString();
  }
}
