import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/utils/discounthandler/translation_locale_retrieval.dart';

class RecentlyViewedSearch extends StatelessWidget {
  Business business;

  RecentlyViewedSearch(this.business);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height / 13,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ImageContainer(
                '/brand_logo_${business.businessId}',
                containerBorderRadius: BorderRadius.circular(5),
                containerBoxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 5)],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TranslationLocalePicker.translationPicker(business.name, context),
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
