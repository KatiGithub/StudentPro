import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/models/retailers/business_type.dart';
import 'package:studio_projects/shared/components/loading_screen.dart';
import 'package:studio_projects/shared/components/map_dialog.dart';
import 'package:studio_projects/shared/components/recently_viewed_search.dart';
import 'package:studio_projects/shared/components/retailer_list.dart';
import 'package:studio_projects/views/main/search/search_cubit.dart';
import 'package:studio_projects/views/main/search/search_state.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchBarController = TextEditingController();

  bool _searchLoading = false;
  bool _searchResultsAvailable = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchCubit>(context).getSearchHistory().then((_) {
      BlocProvider.of<SearchCubit>(context)
          .searchHistory
          .forEach((Business business) => recentlyViewed.add(RecentlyViewedSearch(business)));
      setState(() {});
    });
  }

  List<Widget> recentlyViewed = [];

  final List<BusinessType> categories = [
    BusinessType(1, "Food & Drink"),
    BusinessType(2, "Books & Stationairies"),
    BusinessType(3, "Fashion & Beauty"),
    BusinessType(4, "Co-Working Space"),
    BusinessType(5, "Health & Fitness"),
    BusinessType(6, "Entertainment"),
    BusinessType(7, "Appliances"),
    BusinessType(8, "Tech")
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      return BlocListener<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is SearchLoading) {
            setState(() {
              _searchLoading = true;
            });
          } else if (state is SearchSuccess) {
            setState(() {
              _searchLoading = false;
              _searchResultsAvailable = true;
            });
          }
        },
        child: Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  "Search",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                leading: (_searchResultsAvailable || _searchLoading)
                    ? IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            _searchResultsAvailable = false;
                            _searchLoading = false;

                            BlocProvider.of<SearchCubit>(context).clearSearchResult();
                          });
                        })
                    : const SizedBox.shrink()),
            body: _searchLoading && !_searchResultsAvailable
                ? LoadingScreen()
                : !_searchLoading && _searchResultsAvailable
                    ? RetailerListView(BlocProvider.of<SearchCubit>(context).searchResults)
                    : SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                                child: Row(
                                  children: [
                                    Flexible(
                                        fit: FlexFit.tight,
                                        flex: 16,
                                        child: TextField(
                                          controller: _searchBarController,
                                          decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.symmetric(vertical: 8),
                                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                              prefixIcon: const Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ),
                                              suffixIcon: IconButton(
                                                splashRadius: 0.1,
                                                icon: const Icon(
                                                  Icons.clear,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () {
                                                  _searchBarController.clear();
                                                },
                                              )),
                                          onSubmitted: (_) {
                                            BlocProvider.of<SearchCubit>(context)
                                                .searchByQuery(_searchBarController.text);
                                          },
                                        )),
                                    Flexible(
                                      child: Container(),
                                      flex: 1,
                                      fit: FlexFit.tight,
                                    ),
                                    Flexible(
                                        flex: 2,
                                        fit: FlexFit.tight,
                                        child: GestureDetector(
                                          onTap: () async {
                                            LatLng? pickedLocation = await showDialog<LatLng>(
                                                context: context, builder: (context) => MapDialog());

                                            print(pickedLocation);
                                            if (pickedLocation != null) {
                                              BlocProvider.of<SearchCubit>(context)
                                                  .searchByLocation(pickedLocation.longitude, pickedLocation.latitude);
                                            }
                                          },
                                          child: Image.asset(
                                            "assets/map_icon.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                height: 10,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  physics: PageScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          recentlyViewed.isEmpty
                                              ? const SizedBox.shrink()
                                              : const Text(
                                                  "Recently Viewed",
                                                  style: TextStyle(fontSize: 20),
                                                ),
                                          recentlyViewed.isEmpty
                                              ? const SizedBox.shrink()
                                              : Column(
                                                  children: recentlyViewed,
                                                ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          const Text(
                                            "Categories",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(top: 10),
                                            height: MediaQuery.of(context).size.height / 2,
                                            child: NotificationListener<OverscrollIndicatorNotification>(
                                              onNotification: (notification) {
                                                if (notification is OverscrollIndicatorNotification) {
                                                  notification.disallowIndicator();
                                                }
                                                return false;
                                              },
                                              child: GridView.count(
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10,
                                                childAspectRatio: 2 / 1,
                                                children: [
                                                  ...categories.map((BusinessType e) => GestureDetector(
                                                        onTap: () {
                                                          BlocProvider.of<SearchCubit>(context).searchByCategory(e.id);
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(15),
                                                              gradient: const LinearGradient(
                                                                colors: [
                                                                  Color.fromRGBO(255, 49, 49, 0.8),
                                                                  Color.fromRGBO(255, 135, 74, 1.0)
                                                                ],
                                                              )),
                                                          child: Center(
                                                            child: Text(e.name),
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
      );
    });
  }
}
