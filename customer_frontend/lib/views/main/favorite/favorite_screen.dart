import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:studio_projects/shared/components/discount_card_grouper.dart';

import '../../../shared/common_blocs/favorite/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  static const id = 'favorite';

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final favoriteBloc = Provider.of<FavoriteBloc>(context);
          var discounts = favoriteBloc.favoriteDiscounts;
          print(discounts);
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text("Your Favorites"),
                  ),
                  !(discounts.length > 0)
                      ? SizedBox.shrink()
                      : Expanded(
                          child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          children: [
                            for (int i = 0; i < discounts.length; i++)
                              Container(
                                height: 200,
                                child: DiscountCard(
                                    discount: discounts[i], context: context),
                              )
                          ],
                        ))
                ],
              ),
            ),
          );
        });
  }
}
