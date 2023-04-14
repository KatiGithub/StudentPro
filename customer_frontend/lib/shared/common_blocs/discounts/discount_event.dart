import 'package:equatable/equatable.dart';

import '../../../models/discounts/discount.dart';

class DiscountEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnRetrieveDiscountCode extends DiscountEvent {
  Discount discount;

  OnRetrieveDiscountCode({required this.discount});
}

class OnAddToFavoriteDiscounts extends DiscountEvent {
  Discount discount;

  OnAddToFavoriteDiscounts({required this.discount});
  List<Object> get props => [discount];
}

class OnRetrieveFavoriteDiscounts extends DiscountEvent {}