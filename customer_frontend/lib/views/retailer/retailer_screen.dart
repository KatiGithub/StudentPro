import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/retailers/retailer.dart';
import 'package:studio_projects/models/retailers/retailer_post.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_event.dart';

import '../../shared/common_blocs/favorite/favorite_state.dart';
import '../../shared/common_blocs/retailer/retailer_bloc.dart';
import '../../shared/common_blocs/retailer/retailer_state.dart';

class RetailerScreen extends StatefulWidget {
  static const id = 'retailer';

  @override
  _StateRetailerScreen createState() => _StateRetailerScreen();
}

class _StateRetailerScreen extends State<RetailerScreen> {
  Retailer getRetailerFromNavigator(BuildContext context) {
    return ModalRoute.of(context)!.settings!.arguments as Retailer;
  }

  Retailer retailer = Retailer();
  bool _isLiked = false;


  @override
  Widget build(BuildContext context) {

    if (retailer.RetailerID == null) {
      retailer = getRetailerFromNavigator(context);
    }
    FavoriteBloc favoriteBloc = Provider.of<FavoriteBloc>(context);
    favoriteBloc.add(OnIsFavorite(retailer: retailer));

    RetailerBloc retailerBloc = RetailerBloc();
    // retailerBloc.add(OnGetRetailerInformation(retailer: retailer));

    return Scaffold(
        body: BlocProvider(
      create: (_) {
        retailerBloc.add(OnGetRetailerInformation(retailer: retailer));

        return retailerBloc;
      },
      child: BlocConsumer<RetailerBloc, RetailerState>(
        listener: (context, state) {
          if (state is RetailerLoadComplete) {
            retailer = state.retailer;
          }
        },
        builder: (context, state) {
          retailerBloc.add(OnGetRetailerInformation(retailer: retailer));

          FavoriteBloc favoriteBloc = Provider.of<FavoriteBloc>(context);
          favoriteBloc.add(OnIsFavorite(retailer: retailer));
          return retailer.retailerDescription == null
              ? SizedBox.shrink()
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                        backgroundColor: Colors.red,
                        title: Text(retailer.RetailerName!),
                        centerTitle: true,
                        floating: true,
                        pinned: true,
                        expandedHeight: MediaQuery.of(context).size.height / 4,
                        flexibleSpace: FlexibleSpaceBar(
                            background:
                                BlocConsumer<FavoriteBloc, FavoriteState>(
                          listener: (context, state) {
                            if (state is FavoriteAddedSuccess) {
                              setState(() {
                                _isLiked = true;
                              });
                            }
                            if (state is FavoriteRemovedSuccess) {
                              setState(() {
                                _isLiked = false;
                              });
                            }

                            if (state is FavoriteIsFavorite) {
                              _isLiked = state.isFavorite;
                            }
                          },
                          builder: (context, state) {
                            return Stack(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Image.asset(
                                    'assets/food_test.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                    bottom: 10.0,
                                    right: 10.0,
                                    child: _isLiked
                                        ? GestureDetector(
                                            onTap: () {
                                              favoriteBloc.add(
                                                  OnRemoveFromFavorite(
                                                      retailer: retailer));
                                            },
                                            child: Icon(
                                              Icons.favorite,
                                              size: 40,
                                              color: Colors.red,
                                            ))
                                        : GestureDetector(
                                            onTap: () => favoriteBloc.add(
                                                OnAddToFavorite(
                                                    retailer: retailer)),
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 40,
                                              color: Colors.red,
                                            ),
                                          ))
                              ],
                            );
                          },
                        ))),
                    SliverToBoxAdapter(
                      child: Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.black,
                                thickness: 1.5,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.symmetric(
                                    vertical: 8.0),
                                child: Text(
                                  retailer.retailerDescription == null
                                      ? ""
                                      : retailer.retailerDescription!,
                                  style: TextStyle(fontSize: 17.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 1.5,
                              ),
                            ],
                          )),
                    ),
                    retailer.retailerPosts == null
                        ? SizedBox.shrink()
                        : SliverList(
                            delegate: SliverChildBuilderDelegate(
                                childCount: retailer.retailerPosts!.length,
                                (context, index) {
                            return _createItemCard(
                                retailer.retailerPosts![index]);
                          }))
                  ],
                );
        },
      ),
    ));
  }

  Widget _createItemCard(RetailerPost retailerPost) {
    return Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 8.0, vertical: 9.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    retailerPost.postTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: 15, top: 20, bottom: 20),
                    child: Text(retailerPost.postDescription),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topCenter,
                    child: LayoutGrid(
                      columnSizes: [1.fr, 1.fr],
                      rowSizes: [1.fr, 1.fr],
                      columnGap: 5.0,
                      rowGap: 5.0,
                      gridFit: GridFit.passthrough,
                      children: [
                        SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              retailerPost.postMediaLinks[0],
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              retailerPost.postMediaLinks[1],
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              retailerPost.postMediaLinks[2],
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                            width: double.infinity,
                            child: Image.asset(
                              retailerPost.postMediaLinks[3],
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
