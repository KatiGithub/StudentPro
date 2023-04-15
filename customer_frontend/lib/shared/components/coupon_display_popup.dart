import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_event.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_state.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_state.dart';

class CouponDisplayPopup extends StatefulWidget {
  final CodeDiscount discount;

  CouponDisplayPopup({required this.discount});

  @override
  _CouponDisplayPopupState createState() => _CouponDisplayPopupState();
}

class _CouponDisplayPopupState extends State<CouponDisplayPopup> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteBloc, FavoriteState>(
        listener: (context, state) {
      if (state is FavoriteAddedSuccess) {
        setState(() {
          _isLiked = true;
        });
      } else if (state is FavoriteRemovedSuccess) {
        setState(() {
          _isLiked = false;
        });
      }

      if(state is FavoriteIsFavorite) {
        setState(() {
          _isLiked = state.isFavorite;
        });
      }
    }, builder: (context, state) {
      final favoriteBloc = Provider.of<FavoriteBloc>(context);
      favoriteBloc.add(OnIsFavorite(discount: widget.discount));
      return SizedBox(
        height: 0.75 * MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          child: Image.asset(
                            widget.discount.discountImage!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: _isLiked
                              ? GestureDetector(
                                  onTap: () {
                                    favoriteBloc.add(OnRemoveFromFavorites(
                                        discount: widget.discount));
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    size: 40,
                                    color: Colors.red,
                                  ))
                              : GestureDetector(
                                  onTap: () => favoriteBloc.add(
                                      OnAddToFavorites(
                                          discount: widget.discount)),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 40,
                                    color: Colors.red,
                                  ),
                                ))
                    ],
                  )),
              Flexible(
                  flex: 10,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(widget.discount.couponCode!)],
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
