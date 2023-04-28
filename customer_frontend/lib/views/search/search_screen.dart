import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/retailer.dart';
import 'package:studio_projects/shared/components/category_search_box.dart';
import 'package:studio_projects/shared/components/discount_card_grouper.dart';
import 'package:studio_projects/shared/components/retailer_card_grouper.dart';
import 'package:studio_projects/views/search/search_bloc.dart';
import 'package:studio_projects/views/search/search_event.dart';
import 'package:studio_projects/views/search/search_state.dart';

import '../../models/discounts/discount.dart';
import '../../models/retailers/retailer_type.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Retailer> retailerSearchResults = [];

  bool _searchLoading = false;
  bool _searchResultsReturned = false;

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
    return BlocProvider(
      create: (create) => SearchBloc(),
      child: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is SearchLoading) {
            setState(() {
              _searchLoading = true;
            });
          }
          if (state is SearchSuccess) {
            setState(() {
              retailerSearchResults = state.retailerSearchResults;
              _searchResultsReturned = true;
              _searchLoading = false;
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.purple.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                ),
                title: Builder(
                  builder: (context) => TextField(
                    controller: _searchController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onSubmitted: (searchQuery) {
                      context.read<SearchBloc>().add(
                            OnSearchRequestComplete(
                                searchQuery: _searchController.text),
                          );
                    },
                    decoration: const InputDecoration(
                      hintText: "Search For Discounts",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
                child:
                    (_searchResultsReturned == false && _searchLoading == false)
                        ? GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 8.0,
                            children: [
                              for (int i = 0; i < retailerTypes.length; i++)
                                CategoryBox(retailerType: retailerTypes[i])
                            ],
                          )
                        : (_searchLoading == true)
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : RetailerCardGrouper(
                                retailers: retailerSearchResults,
                                context: context,
                              ),
              ));
        },
      ),
    );
  }
}
