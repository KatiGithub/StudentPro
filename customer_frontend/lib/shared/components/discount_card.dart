import 'package:flutter/material.dart';
import 'package:studio_projects/models/discounts/discount.dart';

class DiscountCard extends StatelessWidget {

  Discount discount;

  DiscountCard(this.discount);

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
