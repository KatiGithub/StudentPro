import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DiscountType extends Equatable {

  String discountTypeID;
  String discountType;

  DiscountType({
    required this.discountTypeID,
    required this.discountType
  });

  @override
  List<Object?> get props => [discountTypeID];
}