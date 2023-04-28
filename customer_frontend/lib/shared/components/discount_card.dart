import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_event.dart';
import 'package:studio_projects/shared/utils/discounthandler/coupon_discount_handler.dart';
import 'package:studio_projects/shared/utils/discounthandler/link_discount_handler.dart';
import '../../models/discounts/discount.dart';
import '../common_blocs/discounts/discount_state.dart';

class DiscountCard extends StatelessWidget {
  Discount discount;
  BuildContext context;

  DiscountCard({required this.discount, required this.context});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (create) => DiscountBloc(),
        child: BlocConsumer<DiscountBloc, DiscountState>(
          listener: (context, state) {
            if(state is DiscountSuccess) {
              discount = state.discount;

              if(discount is CodeDiscount) {
                CouponDiscountHandler(context: context).handleDiscount(discount);
              } else if(discount is LinkDiscount) {
                LinkDiscountHandler().handleDiscount(discount);
              }
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<DiscountBloc>()
                  .add(OnRetrieveDiscountCode(discount: discount)),
              child: SizedBox(
                  width: 400,
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
                              child: Image.asset(
                                discount.discountImage!,
                                fit: BoxFit.fitWidth,
                              )),
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
                  )),
            );
          },
        ));
  }
}
