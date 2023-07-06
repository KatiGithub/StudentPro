import 'dart:core';
import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/link_discount.dart';
import 'package:studio_projects/models/retailers/business.dart';

import '../translation.dart';


class Discount {

  int _id;
  int _claimsPerUser;
  int? _minimumSpend;
  double _expiryDate;
  Business _business;
  List<Translation> _discountTitle;

  Discount(this._id, this._claimsPerUser, this._minimumSpend,
      this._expiryDate, this._business, this._discountTitle);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  int get claimsPerUser => _claimsPerUser;

  set claimsPerUser(int value) {
    _claimsPerUser = value;
  }

  int? get minimumSpend => _minimumSpend;

  set minimumSpend(int? value) {
    _minimumSpend = value;
  }

  double get expiryDate => _expiryDate;

  set expiryDate(double value) {
    _expiryDate = value;
  }

  Business get business => _business;

  set business(Business value) {
    _business = value;
  }

  List<Translation> get discountTitle => _discountTitle;

  set discountTitle(List<Translation> value) {
    _discountTitle = value;
  }

  @override
  static Discount toClass(Map<String, dynamic> json) {
    List<dynamic> discountTitles = json['discountTitle']["translations"];

    if(json['isOnline'] == false) {
      return CodeDiscount(
          json['id'],
          json['claimsPerUser'],
          json['minimumSpend'],
          json['expiryDate'],
          Business.toClass(json['business']),
          discountTitles.map((e) => Translation.toClass(e)).toList());
    } else {
      return LinkDiscount(json['id'],
          json['claimsPerUser'],
          json['minimumSpend'],
          json['expiryDate'],
          Business.toClass(json['business']),
          discountTitles.map((e) => Translation.toClass(e)).toList(), json['linkOnline']);
    }
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}