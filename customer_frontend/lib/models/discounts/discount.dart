import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studio_projects/models/discounts/discountlogo/discount_logo.dart';
import 'package:studio_projects/models/retailers/retailer.dart';

@JsonSerializable()
abstract class Discount extends Equatable {

  double? discountID;
  String? discountTitle;
  String? discountDescription;
  DiscountLogo? discountImage;
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
}