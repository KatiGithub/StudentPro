import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';

class RetailerListView extends StatelessWidget {
  List<Business> businesses;

  RetailerListView(this.businesses);

  @override
  Widget build(BuildContext context) {
    return businesses.isEmpty
        ? Center(
            child: Text("No Retailers Found"),
          )
        : Container(
            child: ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: ImageContainer(
                                  "/brand_logo_${businesses[index].businessId}",
                                  containerPadding: const EdgeInsets.all(20),
                                  containerBorderRadius: BorderRadius.circular(20),
                                  containerBackgroundColor: Colors.black,
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(TranslationLocalePicker.translationPicker(businesses[index].name, context)),
                                        SizedBox(height: 20,),
                                        Text(businesses[index].businessType.name)
                                      ],
                                    ),
                                    IconButton(splashRadius: 0.1, onPressed: () {}, icon: Icon(Icons.navigate_next))
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: index == businesses.length-1 ? SizedBox.shrink() : Divider(color: Colors.black, thickness: 3,),
                        )
                      ],
                    ),
                  );
                }),
          );
  }
}
