import 'package:flutter/material.dart';
import 'package:studio_projects/shared/components/category_search_box.dart';

import '../../models/retailers/retailer_type.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  List<RetailerType> retailerTypes = [
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
    RetailerType(
        retailerType: 'food_and_drinks',
        retailerDisplayName: 'Food and Drinks'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          title: TextField(
            controller: _searchController,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: const InputDecoration(
                hintText: "Search For Discounts",
                hintStyle: TextStyle(color: Colors.white54),
                border: InputBorder.none),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 8.0,
            children: [
              for(int i = 0; i < retailerTypes.length; i++)
                CategoryBox(retailerType: retailerTypes[i])
            ],
        )));
  }
}
