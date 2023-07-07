import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
import 'package:studio_projects/models/discounts/discounttypes/link_discount.dart';
import 'package:studio_projects/shared/service/transaction_service.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';

import 'container_with_requested_image.dart';

class DiscountPopup extends StatefulWidget {
  final Discount discount;

  DiscountPopup(this.discount);

  @override
  State<StatefulWidget> createState() => _DiscountPopupState();
}

class _DiscountPopupState extends State<DiscountPopup> {
  bool _discountAvailable = false;
  bool _limitReached = false;

  final TransactionService transactionService = TransactionService();

  @override
  void initState() {
    super.initState();
    transactionService.checkUserLimit(widget.discount.id).then((bool limitReached) {
      setState(() {
        _limitReached = limitReached;
      });
    });
  }

  String couponCode = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 8,
              child: ImageContainer(
                '/brand_banner_${widget.discount.business.businessId}',
                containerBorderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
            Flexible(
                flex: 16,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 4,
                              fit: FlexFit.tight,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: ImageContainer(
                                  "/brand_logo_${widget.discount.business.businessId}",
                                ),
                              ),
                            ),
                            Flexible(child: Container()),
                            Flexible(
                                flex: 15,
                                fit: FlexFit.tight,
                                child: Text(
                                  TranslationLocalePicker.translationPicker(widget.discount.business.name, context),
                                  style: const TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 3,
                        fit: FlexFit.tight,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                TranslationLocalePicker.translationPicker(widget.discount.discountTitle, context),
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(widget.discount is LinkDiscount ? "Online" : "Instore")
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            Text("Minimum Spend: ${widget.discount.minimumSpend ?? "No Limit"}"),
                            Text("Claims Per User: ${widget.discount.claimsPerUser ?? "No Limit"} ")
                          ],
                        )),
                    Flexible(
                        flex: 9,
                        fit: FlexFit.tight,
                        child: _discountAvailable
                            ? widget.discount is CodeDiscount
                                ? Column(
                                    children: [
                                      QrImage(
                                        data: couponCode,
                                        size: 200,
                                        version: QrVersions.auto,
                                      ),
                                      Text(
                                        couponCode,
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ],
                                  )
                                : Column()
                            : Center(
                                child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 80),
                                height: 60,
                                child: MaterialButton(
                                  disabledColor: Colors.grey,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  color: const Color.fromRGBO(255, 166, 48, 1),
                                  onPressed: _limitReached ? null : () {
                                    if (widget.discount is CodeDiscount) {
                                      CodeDiscount discount = widget.discount as CodeDiscount;
                                      discount.claimCoupon().then((String couponCode) {
                                        setState(() {
                                          this.couponCode = couponCode;
                                          _discountAvailable = true;
                                        });
                                      });
                                    } else if (widget.discount is LinkDiscount) {
                                      LinkDiscount discount = widget.discount as LinkDiscount;
                                      discount.claimCoupon().then((_) => null);
                                    }
                                  },
                                  child: Container(
                                    constraints: const BoxConstraints.expand(),
                                    child: const Center(
                                      child: Text(
                                        "Claim Discount!",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                              )))
                  ],
                ))
          ],
        ));
  }
}
