import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DiscountType extends Equatable {

  String? discountType;

  DiscountType({
    @required this.discountType
  });

  @override
  List<Object?> get props => [discountType];
}