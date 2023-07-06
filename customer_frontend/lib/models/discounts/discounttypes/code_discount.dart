import 'package:flutter/material.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/models/transaction.dart';
import 'package:studio_projects/models/translation.dart';
import 'package:studio_projects/shared/service/discount_service.dart';

class CodeDiscount extends Discount {

  CodeDiscount(
      int id,
      int claimsPerUser,
      int? minimumSpend,
      double expiryDate,
      Business business,
      List<Translation> discountTitle
      ) : super(id, claimsPerUser, minimumSpend, expiryDate, business, discountTitle);

  Future<String> claimCoupon() async {
    DiscountService discountService = DiscountService();
    return await discountService.claimCoupon(id).then((Transaction transaction) {
      return transaction.couponCode!;
    });
  }
}
