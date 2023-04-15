import 'package:flutter/material.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

import '../../models/discounts/discount.dart';

class DiscountCardGrouper extends StatelessWidget {
  final List<Discount> discounts;
  BuildContext context;

  DiscountCardGrouper({required this.discounts, required this.context});

  @override
  Widget build(BuildContext context) {
    List<List<Discount>> discountSplit = [];
    for (int i = 0; i < discounts.length; i++) {
      if (i == 0 || i % 5 == 0) {
        discountSplit.add([discounts[i]]);
      } else {
        discountSplit.last.add(discounts[i]);
      }
    }
    return ListView.builder(
      itemCount: discountSplit.length,
      itemBuilder: (context, index) {
        return _buildGridLayout(discountSplit.elementAt(index));
      },
    );
  }

  Widget _buildGridLayout(List<Discount> discount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 400,
        child: LayoutGrid(
          rowGap: 8.0,
          columnGap: 8.0,
          rowSizes: [1.0.fr, 1.0.fr, 1.0.fr],
          columnSizes: [1.0.fr, 1.0.fr],
          areas: '''
          r r
          x y
          b c
        ''',
          children: [
            gridArea('r').containing(DiscountCard(discount: discount[0], context: this.context,)),
            discount.length >= 2
                ? gridArea('x').containing(DiscountCard(discount: discount[1], context: this.context))
                : SizedBox.shrink(),
            discount.length >= 3
                ? gridArea('y').containing(DiscountCard(discount: discount[2], context: this.context))
                : SizedBox.shrink(),
            discount.length >= 4
                ? gridArea('b').containing(DiscountCard(discount: discount[3], context: this.context))
                : SizedBox.shrink(),
            discount.length >= 5
                ? gridArea('c').containing(DiscountCard(discount: discount[4], context: this.context))
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
