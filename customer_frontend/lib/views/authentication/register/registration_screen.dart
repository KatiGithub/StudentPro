import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';
import 'package:studio_projects/views/authentication/register/steps/intro_registration_screen.dart';
import 'package:studio_projects/views/authentication/register/steps/step1_screen.dart';
import 'package:studio_projects/views/authentication/register/steps/step2_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentPage = 0;
  CarouselController _carouselController = CarouselController();

  void _goToNextPage() {
    _carouselController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {
      currentPage++;
    });
  }

  void _goToPreviousPage() {
    _carouselController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
    setState(() {
      currentPage--;
    });
  }

  final List<Widget> _steps = [
    IntroRegistrationScreen(),
    Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 24), child: RegistrationPage1()),
    Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 24), child: RegistrationPage2()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15, left: 20, right: 20, bottom: 20),
            child: StepProgressIndicator(
              totalSteps: _steps.length,
              currentStep: currentPage + 1,
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 0
                  ? SizedBox.shrink()
                  : const Text(
                      "Registration",
                      style: TextStyle(fontSize: 30),
                    ),
              currentPage == 0
                  ? const SizedBox.shrink()
                  : const SizedBox(
                      height: 100,
                    ),
              BlocProvider(
                  create: (create) => RegistrationCubit(),
                  child: BlocBuilder<RegistrationCubit, RegistrationState>(builder: (context, state) {
                    return Expanded(
                        child: CarouselSlider(
                      carouselController: _carouselController,
                      items: _steps,
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: double.infinity,
                          viewportFraction: 1.0,
                          enlargeCenterPage: true,
                          onScrolled: (double? index) {
                            if (currentPage > index!.abs()) {
                              _goToPreviousPage();
                            } else if(currentPage < index!.abs()){
                              _goToNextPage();
                            }
                          }),
                    ));
                  }))
            ],
          ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                  color: Colors.deepPurple,
                  height: double.infinity,
                  onPressed: currentPage > 0 ? _goToPreviousPage : null,
                  child: const Icon(Icons.arrow_back),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                    color: Colors.deepPurple,
                    height: double.infinity,
                    onPressed: currentPage < 2 ? _goToNextPage : null,
                    child: const Icon(Icons.arrow_forward)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
