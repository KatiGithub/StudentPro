import 'package:flutter/material.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/shared/components/coupon_display_popup.dart';
import 'package:studio_projects/shared/components/modalbottomsheet.dart';

class CodeDiscount extends Discount {
  String? couponCode;

  CodeDiscount(
      {this.couponCode = '',
      discountID,
      discountTitle,
      discountDescription,
      discountImage,
      retailer})
      : super(
            discountID: discountID,
            discountTitle: discountTitle,
            discountDescription: discountDescription,
            discountImage: discountImage);

  @override
  void onClick(BuildContext context) {
    Widget content = CouponDisplayPopup(discount: this);
    displayModalBottomSheet(context, content);
  }
}
