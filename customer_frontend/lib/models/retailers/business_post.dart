import 'package:equatable/equatable.dart';
import 'package:studio_projects/shared/json_serializable.dart';

import '../translation.dart';

class BusinessPost implements JsonSerializable {
  int _id;
  double _datetime;
  List<Translation> _postContent;

  BusinessPost(this._id, this._datetime, this._postContent);

  List<Translation> get postContent => _postContent;

  set postContent(List<Translation> value) {
    _postContent = value;
  }

  double get datetime => _datetime;

  set datetime(double value) {
    _datetime = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  static BusinessPost toClass(Map<String, dynamic> json) {
    List<Map<String, dynamic>> postContent = json['postContentTextId'];

    return BusinessPost(
      json['id'],
      json['datetime'],
      postContent.map((e) => Translation.toClass(e)).toList()
    );
  }

  @override
  String toJson() {
    Map<String, dynamic> data = {};

    return data.toString();
  }
}
