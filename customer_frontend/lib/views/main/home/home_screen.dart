import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:studio_projects/shared/components/display_popup.dart';
import 'package:studio_projects/shared/components/retailer_card.dart';
import 'package:studio_projects/shared/utils/location/location_util.dart';
import 'package:studio_projects/shared/utils/translation_locale_retrieval.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';

import '../../../models/discounts/discount.dart';
import '../../../models/retailers/business.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentRetailer = 0;

  ScrollController scrollController = ScrollController();
  List<Discount> inYourAreaDiscounts = [];

  var key = UniqueKey();

  void scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
      // User has scrolled to the top, trigger refresh action
      GoRouter.of(context).refresh();
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
    scrollController.addListener(scrollListener);
  }

  void initialize() {
    BlocProvider.of<HomeCubit>(context).loadHome();
    BlocProvider.of<HomeCubit>(context).updateUserLocation().then((_) {
      LocationUtil.requestUserPermission().then((LocationPermission locationPermission) {
        setState(() {
          _locationEnabled =
              locationPermission == LocationPermission.always || locationPermission == LocationPermission.whileInUse;
        });
      });
    });

    retailers.clear();
    recommendedDiscounts.clear();
    inYourAreaDiscounts.clear();
  }

  bool _locationEnabled = false;

  List<Widget> retailers = [];

  List<Widget> recommendedDiscounts = [];

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return BlocListener<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLoaded) {
            setState(() {
              BlocProvider.of<HomeCubit>(context).retailers.forEach((Business business) {
                retailers.add(RetailerCard(business));
              });

              BlocProvider.of<HomeCubit>(context).recommendedDiscount.forEach((Discount discount) {
                recommendedDiscounts.add(DiscountCard(discount));
              });
              List<Discount> discounts = BlocProvider.of<HomeCubit>(context).discountsInYourArea;
              inYourAreaDiscounts = discounts;
              key = UniqueKey();
            });

          }
        },
        child: retailers.isEmpty
            ? const SizedBox.shrink()
            : SafeArea(
                child: Scaffold(
                    key: key,
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 12),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Flexible(
                                flex: 3,
                                fit: FlexFit.tight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Hi, ${BlocProvider.of<AuthCubit>(context).state.user.firstName!}",
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                    )
                                  ],
                                )),
                            Expanded(child: Image.asset("assets/mahapro_logo.png"))
                          ],
                        ),
                      ),
                    ),
                    body: RefreshIndicator(
                      onRefresh: () {
                        return Future.delayed(const Duration(), () {
                          initialize();
                        });
                      },
                      child: SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height / 3.6,
                                padding: const EdgeInsets.only(left: 20, right: 20),
                                margin: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: CarouselSlider(
                                          carouselController: carouselController,
                                          items: retailers,
                                          options: CarouselOptions(
                                              animateToClosest: true,
                                              viewportFraction: 0.999,
                                              aspectRatio: 16 / 9,
                                              enlargeCenterPage: true,
                                              onPageChanged: (int index, CarouselPageChangedReason _) {
                                                setState(() {
                                                  _currentRetailer = index;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        flex: 1,
                                        fit: FlexFit.tight,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width / 1.5,
                                          child: StepProgressIndicator(
                                            totalSteps: retailers.length,
                                            currentStep: _currentRetailer + 1,
                                            selectedColor: Colors.black,
                                            roundedEdges: const Radius.circular(20),
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                                height: MediaQuery.of(context).size.height / 2.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Container(
                                      child: const Text(
                                        "Recommended",
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    )),
                                    Flexible(
                                        flex: 8,
                                        fit: FlexFit.tight,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 20),
                                          child: GridView.count(
                                              physics: const ClampingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 20,
                                              childAspectRatio: 3 / 10,
                                              children: [
                                                for (int i = 0; i < 9; i++)
                                                  GestureDetector(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled: true,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(30)),
                                                          builder: (BuildContext context) {
                                                            return DiscountPopup(inYourAreaDiscounts[i]);
                                                          });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          border: Border.all(
                                                              color: Colors.black54,
                                                              width: 3,
                                                              strokeAlign: BorderSide.strokeAlignOutside)),
                                                      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              child: AspectRatio(
                                                            aspectRatio: 1 / 1,
                                                            child: Container(
                                                              margin: const EdgeInsets.all(10),
                                                              child: ImageContainer(
                                                                "brand_logo/${inYourAreaDiscounts[i].business.businessId}",
                                                                containerBorderRadius: BorderRadius.circular(5),
                                                              ),
                                                            ),
                                                          )),
                                                          Flexible(
                                                              flex: 3,
                                                              fit: FlexFit.tight,
                                                              child: Container(
                                                                padding: const EdgeInsets.only(left: 10),
                                                                decoration: const BoxDecoration(
                                                                    border: Border(
                                                                        left:
                                                                            BorderSide(color: Colors.grey, width: 3))),
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(TranslationLocalePicker.translationPicker(
                                                                        inYourAreaDiscounts[i].business.name, context)),
                                                                    Text(TranslationLocalePicker.translationPicker(
                                                                        inYourAreaDiscounts[i].discountTitle, context))
                                                                  ],
                                                                ),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              ]),
                                        ))
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: recommendedDiscounts,
                              ))
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
      );
    });
  }
}
