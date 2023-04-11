import 'package:flutter/cupertino.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkDiscount extends Discount {
  String linkRedirect;

  LinkDiscount({required this.linkRedirect});

  @override
  void onClick(BuildContext context) {
    launch(this.linkRedirect);
  }
}
