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
            if (state is DiscountSuccess) {
              discount = state.discount;

              if (discount is CodeDiscount) {
                CouponDiscountHandler(context: context)
                    .handleDiscount(discount);
              } else if (discount is LinkDiscount) {
                LinkDiscountHandler().handleDiscount(discount);
              }
            }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () => context
                  .read<DiscountBloc>()
                  .add(OnRetrieveDiscountCode(discount: discount)),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  discount.discountImage!.imageUrl,
                                ),
                                fit: BoxFit.fitWidth
                              )
                            ),
                          )
                        ),
                      Container(
                        padding: EdgeInsetsDirectional.symmetric(vertical: 5),
                        margin: EdgeInsetsDirectional.only(start: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            discount.discountTitle!,
                            style: TextStyle(
                              fontSize: 10
                            ),
                          ),
                        )
                      )
                      ],
                    ),
                  )
            );
          },
        ));
  }
}
