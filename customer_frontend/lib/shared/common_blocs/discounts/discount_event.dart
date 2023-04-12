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