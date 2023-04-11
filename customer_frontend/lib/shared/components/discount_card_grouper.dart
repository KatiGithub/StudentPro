import 'package:flutter/material.dart';
import 'package:studio_projects/shared/components/discount_card.dart';

import '../../models/discounts/discount.dart';

class DiscountCardGrouper extends StatelessWidget {
  final List<Discount> discounts;

  DiscountCardGrouper({required this.discounts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if(index % 5 == 0 || (index + 1) % 5 == 0) {
          return DiscountCard(discount: discounts[index], width: 400);
        } else {
          return DiscountCard(discount: discounts[index], width: 200);
        }
      },
      itemCount: discounts.length,);
  }
}
