import 'package:flutter/material.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/components/display_popup.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';

class DiscountCard extends StatelessWidget {
  Discount discount;
  double? titleSize;
  EdgeInsets? cardPadding;
  BorderRadius? sheetBorderRadius;
  List<BoxShadow>? sheetBoxShadow;

  DiscountCard(this.discount, {this.titleSize, this.cardPadding, this.sheetBorderRadius, this.sheetBoxShadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cardPadding ?? const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      height: MediaQuery.of(context).size.height / 3.6,
      child: Column(
        children: [
          Flexible(
              flex: 9,
              fit: FlexFit.tight,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(borderRadius: sheetBorderRadius ?? BorderRadius.circular(30)),
                        builder: (BuildContext context) {
                          return DiscountPopup(discount);
                        });
                  },
                  child: ImageContainer(
                    "/discount_banner_${discount.id}",
                    containerBackgroundColor: Colors.teal,
                    containerBorderRadius: BorderRadius.circular(40),
                    containerBoxShadow: sheetBoxShadow ?? const [BoxShadow(color: Colors.black54, blurRadius: 15)],
                    containerChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 10),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: ImageContainer(
                                    "/brand_logo_${discount.business.businessId}",
                                    containerBackgroundColor: Colors.redAccent,
                                    containerBorderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                    padding: const EdgeInsets.only(top: 8, left: 10),
                    child: Text(
                      TranslationLocalePicker.translationPicker(discount.discountTitle, context),
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: titleSize ?? 15),
                    ),
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
