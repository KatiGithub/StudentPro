import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/shared/utils/discounthandler/discount_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkDiscountHandler extends DiscountHandler {
  @override
  void handleDiscount(Discount discount) {
    LinkDiscount _discount = discount as LinkDiscount;

    Uri uri = Uri.parse(_discount.linkRedirect);
    launchUrl(uri);
  }

}