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


  DiscountCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      height: MediaQuery.of(context).size.height / 3.6,
      child: Column(
        children: [
          Flexible(
              flex: 9,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [const BoxShadow(color: Colors.black54, blurRadius: 15)]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 10),
                            height: 60,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 8, left: 20),
                        child: const Text(
                          "Discount title will stand here!",
                          textAlign: TextAlign.start,
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
