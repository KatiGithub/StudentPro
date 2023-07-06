// import 'package:flutter/material.dart';
//
// import 'package:studio_projects/models/discounts/discount.dart';
// import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
// import 'package:studio_projects/shared/components/modalbottomsheet.dart';
// import 'package:studio_projects/shared/utils/discounthandler/discount_handler.dart';
//
// import '../../components/display_popup.dart';
//
// class CouponDiscountHandler extends DiscountHandler {
//   BuildContext context;
//
//   CouponDiscountHandler({required this.context});
//
//   @override
//   void handleDiscount(Discount discount) {
//     Discount _discount = discount;
//
//     Widget content = CouponDisplayPopup(discount: _discount);
//     displayModalBottomSheet(context, content);
//   }
//
// }