import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_cubit.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_state.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:studio_projects/shared/components/loading_screen.dart';
import 'package:studio_projects/shared/components/recently_viewed_search.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';
import 'package:studio_projects/views/main/favorite/favorite_cubit.dart';
import 'package:studio_projects/views/main/favorite/favorite_state.dart';

class RetailerScreen extends StatefulWidget {
  static const id = 'retailer';

  Business business;

  RetailerScreen(this.business);

  @override
  _StateRetailerScreen createState() => _StateRetailerScreen();
}

class _StateRetailerScreen extends State<RetailerScreen> {
  List<Discount> discounts = [];
  List<Widget> relatedBusinesses = [];

  bool _isLoading = false;
  bool _resultsReady = false;

  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RetailerCubit>(context).business = widget.business;
    BlocProvider.of<RetailerCubit>(context).getDiscountsByBusinessId();
    BlocProvider.of<RetailerCubit>(context).addUserClick();
    BlocProvider.of<RetailerCubit>(context).getRelatedBusinesses().then((_) {});

    BlocProvider.of<FavoriteCubit>(context)
        .checkFavoriteRetailer(widget.business.businessId)
        .then((bool isFavorite) {
      setState(() {
        this._isFavorite = isFavorite;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RetailerCubit, RetailerState>(builder: (context, state) {
      return BlocListener<RetailerCubit, RetailerState>(
        listener: (context, state) {
          if (state is RetailerLoading) {
            setState(() {
              _isLoading = true;
            });
          } else if (state is RetailerSuccess) {
            setState(() {
              _isLoading = false;
              _resultsReady = true;
              discounts = BlocProvider.of<RetailerCubit>(context).discounts;
              this.relatedBusinesses.clear();
              BlocProvider.of<RetailerCubit>(context).relatedBusinesses.forEach((Business business) {
                this.relatedBusinesses.add(RecentlyViewedSearch(business));
              });
            });
          } else if (state is RetailerError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorCode)));
          }
        },
        child: _isLoading
            ? LoadingScreen()
            : !_isLoading && _resultsReady
                ? SafeArea(
                    child: Scaffold(
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: ImageContainer(
                                  "brand_banner/${widget.business.businessId}"),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: AspectRatio(
                                    aspectRatio: 1,
                                    child: ImageContainer(
                                        "brand_logo/${widget.business.businessId}"),
                                  )),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    flex: 5,
                                    fit: FlexFit.tight,
                                    child: Text(
                                      TranslationLocalePicker.translationPicker(
                                          widget.business.name, context),
                                      style: const TextStyle(fontSize: 25),
                                    ),
                                  ),
                                  BlocListener<FavoriteCubit, FavoriteState>(
                                    listener: (context, state) {
                                      if (state is FavoriteError) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(state.error)));
                                      }
                                    },
                                    child: IconButton(
                                        onPressed: () {
                                          BlocProvider.of<FavoriteCubit>(
                                                  context)
                                              .favoritePress(
                                                  widget.business.businessId)
                                              .then((_) {
                                            BlocProvider.of<FavoriteCubit>(
                                                    context)
                                                .checkFavoriteRetailer(
                                                    widget.business.businessId)
                                                .then((bool isFavorite) {
                                              setState(() {
                                                this._isFavorite = isFavorite;
                                              });
                                            });
                                          });
                                        },
                                        iconSize: 35,
                                        splashRadius: 0.1,
                                        color: Colors.red,
                                        icon: Icon(_isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline)),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            this.discounts.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text("Promotions"),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    childAspectRatio: 12 / 9,
                                                    mainAxisSpacing: 10,
                                                    crossAxisSpacing: 10),
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: discounts.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              Discount discount =
                                                  discounts[index];
                                              return DiscountCard(
                                                discount,
                                                titleSize: 10,
                                                cardPadding: EdgeInsets.zero,
                                                sheetBorderRadius:
                                                    BorderRadius.circular(10),
                                                sheetBoxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black54,
                                                      blurRadius: 10)
                                                ],
                                                showLogo: false,
                                              );
                                            })
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Related"),
                                  SizedBox(height: 10,),
                                  ...this.relatedBusinesses
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
      );
    });
  }
}
