import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_event.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_state.dart';

class CouponDisplayPopup extends StatefulWidget {
  final CodeDiscount discount;

  CouponDisplayPopup({required this.discount});

  @override
  _CouponDisplayPopupState createState() => _CouponDisplayPopupState();
}

class _CouponDisplayPopupState extends State<CouponDisplayPopup> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Provider.of<DiscountBloc>(context),
      child: BlocConsumer<DiscountBloc, DiscountState>(
        listener: (context, state) {
          if(state is DiscountAddedToFavoritesSuccess) {
            setState(() {});
          }
        },
        builder: (context, state) {
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
                            child: Builder(
                              builder: (context) => GestureDetector(
                                    onTap: () {
                                      context.read<DiscountBloc>().add(
                                          OnAddToFavoriteDiscounts(
                                              discount: widget.discount));
                                    },
                                    child: Icon(
                                      state.favoriteDiscounts != null &&
                                              state.favoriteDiscounts!
                                                  .contains(widget.discount)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 40,
                                      color: Colors.red,
                                    ))
                            ),
                          )
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
        },
      ),
    );
  }
}
