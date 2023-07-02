import 'package:equatable/equatable.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class University implements JsonSerializable {
  double _universityId;
  String _name;
  String _country;

  University(this._universityId, this._name, this._country);


  double get universityId => _universityId;

  set universityId(double value) {
    _universityId = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  @override
  static University toClass(Map<String, dynamic> json) {
    return University(json['id'], json['name'], json['country']);
  }

  @override
  String toJson() {
    return {
      'id': _universityId,
      'name': _name,
      'country': _country
    }.toString();
  }
}