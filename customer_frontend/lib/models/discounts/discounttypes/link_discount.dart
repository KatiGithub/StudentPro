import 'package:flutter/cupertino.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/translation.dart';
import 'package:studio_projects/shared/service/discount_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../retailers/business.dart';

class LinkDiscount extends Discount {
  String linkDiscount;

  LinkDiscount(
      int id,
      int claimsPerUser,
      int? minimumSpend,
      double expiryDate,
      Business business,
      List<Translation> discountTitle,
      this.linkDiscount
      ) : super(id, claimsPerUser, minimumSpend, expiryDate, business, discountTitle);


  Future<void> claimCoupon() async {
    DiscountService discountService = DiscountService();

    return await discountService.claimCoupon(id).then((value) => null);
  }
}
