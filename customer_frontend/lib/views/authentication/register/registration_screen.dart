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
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    setState(() {
      currentPage++;
    });
  }

  void _goToPreviousPage() {
    setState(() {
      currentPage--;
    });
  }

  final List<Widget> _steps = [
    IntroRegistrationScreen(),
    Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 24), child: RegistrationPage1()),
    // Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 24), child: RegistrationPage2()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
              top: 30,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 80,
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                      child: StepProgressIndicator(
                    totalSteps: _steps.length,
                    currentStep: currentPage + 1,
                    selectedColor: Colors.black,
                    unselectedColor: Colors.grey,
                  ))
                ]),
              )),
          Positioned(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 0
                  ? SizedBox.shrink()
                  : Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: const Text(
                          "Registration",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
              BlocProvider(
                  create: (create) => RegistrationCubit(),
                  child: Expanded(
                      child: PageView(
                    onPageChanged: (int index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    controller: _pageController,
                    children: _steps,
                  ))),
            ],
          ))
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 100,
      //     width: MediaQuery.of(context).size.width,
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Expanded(
      //             child: Padding(
      //           padding: EdgeInsets.all(10),
      //           child: MaterialButton(
      //             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      //             color: Colors.deepPurple,
      //             height: double.infinity,
      //             onPressed: currentPage > 0 ? _goToPreviousPage : null,
      //             child: const Icon(Icons.arrow_back),
      //           ),
      //         )),
      //         Expanded(
      //             child: Padding(
      //           padding: EdgeInsets.all(10),
      //           child: MaterialButton(
      //               shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      //               color: Colors.deepPurple,
      //               height: double.infinity,
      //               onPressed: currentPage < 2 ? _goToNextPage : null,
      //               child: const Icon(Icons.arrow_forward)),
      //         ))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
