import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/models/translation.dart';
import 'package:studio_projects/shared/json_serializable.dart';

class Branch implements JsonSerializable {
  int _id;
  int _longitude;
  int _latitude;
  String? _phoneNumber;
  Business _business;
  List<Translation> _branchNames;

  Branch(this._id, this._longitude, this._latitude, this._phoneNumber, this._business, this._branchNames);

  List<Translation> get branchNames => _branchNames;

  set branchNames(List<Translation> value) {
    _branchNames = value;
  }

  Business get business => _business;

  set business(Business value) {
    _business = value;
  }

  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
  }

  int get latitude => _latitude;

  set latitude(int value) {
    _latitude = value;
  }

  int get longitude => _longitude;

  set longitude(int value) {
    _longitude = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  static Branch toClass(Map<String, dynamic> json) {
    int longitude = json['location']['longitude'];
    int latitude = json['location']['latitude'];
    List<Map<String, dynamic>> translations = json['translations'];

    return Branch(json['id'], longitude, latitude, json['phoneNumber'], Business.toClass(json['business']),
        translations.map((e) => Translation.toClass(e)).toList());
  }

  @override
  String toJson() {
    throw UnimplementedError();
  }
}
