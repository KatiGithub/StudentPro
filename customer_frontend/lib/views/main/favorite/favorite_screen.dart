import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_state.dart';
import 'package:studio_projects/shared/components/retailer_card_grouper.dart';

import '../../../models/retailers/retailer.dart';
import '../../../shared/common_blocs/favorite/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Retailer> favoriteRetailers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<FavoriteBloc, FavoriteState>(
            listener: (context, state) {},
            builder: (context, state) {
              FavoriteBloc favoriteBloc = Provider.of<FavoriteBloc>(context);
              favoriteRetailers = favoriteBloc.retailers;

              return RetailerCardGrouper(
                  retailers: favoriteRetailers, context: context);
            },
          ),
    );
  }
}
