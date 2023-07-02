
import 'package:equatable/equatable.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class BusinessType extends Equatable implements JsonSerializable {
  int _id;
  String _name;

  BusinessType(this._id, this._name);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  static BusinessType toClass(Map<String, dynamic> json) {
    return BusinessType(json['id'], json['name']);
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
