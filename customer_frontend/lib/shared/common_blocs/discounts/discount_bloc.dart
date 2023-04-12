import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_event.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_state.dart';

import '../../../models/discounts/discount.dart';

class DiscountBloc extends Bloc<DiscountEvent, DiscountState> {
  DiscountBloc(): super(DiscountInitial()) {
    on<OnRetrieveDiscountCode>((event, emit) => _retrieveDiscountCode(event));
  }

  void _retrieveDiscountCode(OnRetrieveDiscountCode event) async {
    await Future.delayed(Duration(seconds: 0));

    Discount discount = event.discount;

    if(discount is LinkDiscount) {
      discount = discount as LinkDiscount;

      discount.linkRedirect = "https://www.facebook.com";
    } else if(discount is CodeDiscount) {
      discount = discount as CodeDiscount;

      discount.couponCode = "XXXX-XXXXX-XXXX";
    }
    emit(DiscountSuccess(discount: discount));

    emit(DiscountInitial());
  }
}