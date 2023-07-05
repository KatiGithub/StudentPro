import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/components/map_dialog.dart';
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

  @override
  Widget build(BuildContext context) {

    final List<Widget> recentlyViewed = [
      Container(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 5)]),
                ),
              ),
            ),
            Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "McDonald's",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next))
                    ],
                  ),
                ))
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 5)]),
                ),
              ),
            ),
            Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "JD Sports",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.navigate_next))
                    ],
                  ),
                ))
          ],
        ),
      )
    ];

    final List<BusinessCategories> categories = [
      BusinessCategories(1, "Food & Drink"),
      BusinessCategories(2, "Books & Stationairies"),
      BusinessCategories(3, "Fashion & Beauty"),
      BusinessCategories(4, "Co-Working Space"),
      BusinessCategories(5, "Health & Fitness"),
      BusinessCategories(6, "Entertainment"),
      BusinessCategories(7, "Appliances"),
      BusinessCategories(8, "Tech")
    ];

    return BlocListener<SearchCubit, SearchState>(
      listener: (context, state) {
        if(state is SearchLoading) {
          setState(() {
            _searchLoading = true;
          });
        } else if(state is SearchSuccess) {

        }
      },
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Search",
                style: TextStyle(fontSize: 30),
              ),
              Container(
                height: 10,
              ),
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
                            LatLng? pickedLocation =
                                await showDialog<LatLng>(context: context, builder: (context) => MapDialog());

                            print(pickedLocation);
                          },
                          child: Image.asset(
                            "assets/map_icon.png",
                            fit: BoxFit.fill,
                          ),
                        ))
                  ],
                ),
              ),
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
                        if(notification is OverscrollIndicatorNotification) {
                          notification.disallowIndicator();
                        }
                        return false;
                      },
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2/1,
                        children: [
                          ...categories.map((BusinessCategories e) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                  colors: [
                                    Color.fromRGBO(255, 49, 49, 0.8),
                                    Color.fromRGBO(255,135,74, 1.0)
                                  ],
                              )
                            ),
                            child: Center(
                              child: Text(e.name),
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
      )),
    );
  }
}

class BusinessCategories {
  int id;
  String name;

  BusinessCategories(this.id, this.name);
}
