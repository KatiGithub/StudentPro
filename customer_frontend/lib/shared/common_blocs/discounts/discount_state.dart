import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';

abstract class DiscountState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DiscountInitial extends DiscountState {}

class DiscountLoading extends DiscountState {}

class DiscountSuccess extends DiscountState {
  Discount discount;

  DiscountSuccess({required this.discount});

  List<Object> get props => [discount];
}

class DiscountUsed extends DiscountState {}
