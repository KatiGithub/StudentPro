import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:studio_projects/models/discounts/discountlogo/discount_logo.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/json_serializable.dart';

import '../translation.dart';


class Discount implements JsonSerializable {

  int _id;
  bool _isOnlineOrInstore;
  int _claimsPerUser;
  int? _minimumSpend;
  String? _linkOnline;
  double _expiryDate;
  Business _business;
  List<Translation> _discountTitle;

  Discount(this._id, this._isOnlineOrInstore, this._claimsPerUser, this._minimumSpend, this._linkOnline,
      this._expiryDate, this._business, this._discountTitle);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  bool get isOnlineOrInstore => _isOnlineOrInstore;

  set isOnlineOrInstore(bool value) {
    _isOnlineOrInstore = value;
  }

  int get claimsPerUser => _claimsPerUser;

  set claimsPerUser(int value) {
    _claimsPerUser = value;
  }

  int? get minimumSpend => _minimumSpend;

  set minimumSpend(int? value) {
    _minimumSpend = value;
  }

  String? get linkOnline => _linkOnline;

  set linkOnline(String? value) {
    _linkOnline = value;
  }

  double get expiryDate => _expiryDate;

  set expiryDate(double value) {
    _expiryDate = value;
  }

  Business get business => _business;

  set business(Business value) {
    _business = value;
  }

  List<Translation> get translations => _discountTitle;

  set translations(List<Translation> value) {
    _discountTitle = value;
  }

  @override
  static Discount toClass(Map<String, dynamic> json) {
    List<dynamic> discountTitles = json['discountTitle']["translations"];

    return Discount(
        json['id'],
        json['isOnlineOrInStore'],
        json['claimsPerUser'],
        json['minimumSpend'],
        json['linkOnline'],
        json['expiryDate'],
        Business.toClass(json['business']),
        discountTitles.map((e) => Translation.toClass(e)).toList());
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}