import 'package:flutter/material.dart';
import 'package:studio_projects/models/retailers/retailer_type.dart';

class CategoryBox extends StatelessWidget {
  final RetailerType retailerType;

  CategoryBox({required this.retailerType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => print("Pressed on ${this.retailerType.retailerType}"),
        child: Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.5), BlendMode.srcOver),
                    image: AssetImage(
                      'assets/category/' + retailerType.retailerType + ".jpg",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: Text(
                retailerType.retailerDisplayName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
            )));
  }
}
