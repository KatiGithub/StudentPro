import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/components/loading_screen.dart';
import 'package:studio_projects/shared/components/retailer_list.dart';
import 'package:studio_projects/views/main/favorite/favorite_state.dart';

import '../../../models/retailers/business.dart';
import 'favorite_cubit.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Business> favoriteRetailers = [];

  bool _loading = false;
  bool _resultsReady = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteCubit>(context).getFavoriteBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
      return BlocListener<FavoriteCubit, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteLoading) {
              setState(() {
                _loading = true;
              });
            } else if (state is FavoriteSuccess) {
              _loading = false;
              _resultsReady = true;

              favoriteRetailers = BlocProvider.of<FavoriteCubit>(context).favoriteBusinesses;
            }
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (_resultsReady && !_loading)
                    ? () {
                        BlocProvider.of<FavoriteCubit>(context).getFavoriteBusinesses();
                      }
                    : null,
                splashRadius: 10,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              title: Text(
                "Favorite",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            body: _loading && !_resultsReady
                ? LoadingScreen()
                : !_loading && _resultsReady
                    ? RetailerListView(favoriteRetailers)
                    : SizedBox.shrink(),
          ));
    });
  }
}
