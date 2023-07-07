import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

class RetailerCard extends StatelessWidget {
  Business business;

  RetailerCard(this.business);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push("/retailer", extra: business);
      },
      child: ImageContainer(
        "/brand_banner_${this.business.businessId}",
        containerBackgroundColor: Colors.red,
        containerBorderRadius: BorderRadius.circular(20),
        containerChild: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(flex: 10, fit: FlexFit.tight, child: Container()),
            Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1 / 1,
                      child: ImageContainer(
                        "/brand_logo_${this.business.businessId}",
                        containerBorderRadius: BorderRadius.circular(15),
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                          TranslationLocalePicker.translationPicker(business.businessSlogan, context),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
          ],
        ),
      ),
    );
  }
}
