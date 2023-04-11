import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:studio_projects/models/retailer.dart';

abstract class Discount extends Equatable {

  double? discountID;
  String? discountTitle;
  String? discountDescription;
  String? discountImage;
  Retailer? retailer = Retailer();

  Discount({
    this.discountID,
    this.discountTitle,
    this.discountDescription,
    this.discountImage,
    this.retailer
  });

  @override
  List<Object?> get props => [discountID];

  void onClick(BuildContext context) {}
}