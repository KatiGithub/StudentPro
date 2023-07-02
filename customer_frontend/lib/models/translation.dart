
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/json_serializable.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

class Translation implements JsonSerializable {

  int _id;
  String _translation;
  String _language;

  Translation(this._id, this._translation, this._language);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get translation => _translation;

  set translation(String value) {
    _translation = value;
  }

  String get language => _language;

  set language(String value) {
    _language = value;
  }


  @override
  static Translation toClass(Map<String, dynamic> json) {
    return Translation(json['id'], json['translation'], json['language']);
  }

  @override
  String toJson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['translation'] = translation;
    data['language'] = language;

    return data.toString();
  }
}