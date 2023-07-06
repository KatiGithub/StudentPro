import 'package:carousel_slider/carousel_slider.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:studio_projects/models/discounts/discounttypes/code_discount.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:studio_projects/shared/components/discount_card_grouper.dart';
import 'package:studio_projects/shared/components/retailer_card.dart';
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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).loadHome();
  }

  List<Widget> retailers = [];

  List<Widget> recommendedDiscounts = [];

  @override
  Widget build(BuildContext context) {



    CarouselController carouselController = CarouselController();

    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if(state is HomeLoaded) {
              setState(() {
                BlocProvider.of<HomeCubit>(context).retailers.forEach((Business business) {
                  retailers.add(RetailerCard(business));
                });

                BlocProvider.of<HomeCubit>(context).recommendedDiscount.forEach((Discount discount) {
                  recommendedDiscounts.add(DiscountCard(discount));
                });
              });
            }
          },
          child: retailers.isEmpty ? const SizedBox.shrink() : SafeArea(
            child: Scaffold(
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
                body: SingleChildScrollView(
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
                                      "In Your Area",
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
                                            Container(
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
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                                color: Colors.black,
                                                                boxShadow: const [
                                                                  BoxShadow(color: Colors.black54, blurRadius: 8)
                                                                ]),
                                                          ),
                                                        ),
                                                      )),
                                                  Flexible(
                                                      flex: 3,
                                                      fit: FlexFit.tight,
                                                      child: Container(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        decoration: const BoxDecoration(
                                                            border: Border(left: BorderSide(color: Colors.grey, width: 3))),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [const Text("Name"), const Text("Discount")],
                                                        ),
                                                      ))
                                                ],
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
                )),
          ),
        );
    });

  }
}
