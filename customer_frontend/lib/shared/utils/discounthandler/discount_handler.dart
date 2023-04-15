import 'package:studio_projects/models/discounts/discount.dart';

abstract class DiscountHandler {
  void handleDiscount(Discount discount);
}