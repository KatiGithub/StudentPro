import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/link_discount.dart';

class DiscountState extends Equatable {
  List<Discount>? favoriteDiscounts;

  DiscountState({this.favoriteDiscounts});

  @override
  List<Object?> get props => [];
}

class DiscountInitial extends DiscountState {}

class DiscountLoading extends DiscountState {}

class DiscountAddedToFavoritesSuccess extends DiscountState {}

class DiscountSuccess extends DiscountState {
  Discount discount;

  DiscountSuccess({required this.discount});

  List<Object> get props => [discount];
}

class DiscountUsed extends DiscountState {}
