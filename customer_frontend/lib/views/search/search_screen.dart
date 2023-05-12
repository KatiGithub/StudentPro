import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/retailers/retailer.dart';
import 'package:studio_projects/shared/components/category_search_box.dart';
import 'package:studio_projects/shared/components/discount_card_grouper.dart';
import 'package:studio_projects/shared/components/retailer_card_grouper.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
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
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

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
                      color: settingsBloc.state.settings!.darkMode!
                          ? Colors.black
                          : Color.fromRGBO(86, 213, 232, 100)),
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
                child: (_searchResultsReturned == false &&
                        _searchLoading == false)
                    ? ListView.builder(
                        itemCount: retailerTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: EdgeInsetsDirectional.symmetric(vertical: 10, horizontal: 20),
                              child: CategoryBox(
                                  retailerType: retailerTypes[index]));
                        },
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
