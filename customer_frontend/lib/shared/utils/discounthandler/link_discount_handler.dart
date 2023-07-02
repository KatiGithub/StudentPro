import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/shared/utils/discounthandler/discount_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkDiscountHandler extends DiscountHandler {
  @override
  void handleDiscount(Discount discount) {

    Uri uri = Uri.parse("https://www.google.com");
    launchUrl(uri);
  }

}