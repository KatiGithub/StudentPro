import 'package:flutter/material.dart';
import 'package:studio_projects/models/retailers/retailer_type.dart';

class CategoryBox extends StatelessWidget {
  final RetailerType retailerType;

  CategoryBox({required this.retailerType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Text(
                retailerType.retailerDisplayName,
                style: TextStyle(color: Colors.white),
              ),
            )));
  }
}
