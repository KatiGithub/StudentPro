import 'package:flutter/material.dart';
import '../../models/discounts/discount.dart';

class DiscountCard extends StatelessWidget {
  final Discount discount;
  final double width;

  DiscountCard({required this.discount, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => discount.onClick(context),
        child: SizedBox(
            width: width,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      child: Image.asset(discount.discountImage!, fit: BoxFit.fitWidth,)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          discount.discountTitle!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          discount.discountDescription!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
