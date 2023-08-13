

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:studio_projects/shared/components/retailer_card.dart';

class BrandTopSlider extends StatelessWidget {

  CarouselController carouselController = CarouselController();
  List<RetailerCard> retailers;
  int _currentRetailer = 0;
  Function onLoadingCompleted;

  BrandTopSlider(this.retailers, this.onLoadingCompleted) {
    // this.retailers.forEach((Business business) {
    //   _completers.
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}