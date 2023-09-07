import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:horizontal_blocked_scroll_physics/horizontal_blocked_scroll_physics.dart';
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

  final _pageViewController = PageController();

  void _goToNextPage() {
    if (currentPage < 1) {
      setState(() {
        currentPage++;
      });
    }
    // _pageViewController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
      });
      // _pageViewController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  final List<Widget> _steps = [RegistrationPage1()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            color: Colors.black,
            onPressed: () {
              context.pop();
            },
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Column(children: [
            Expanded(child: _steps[0])
          ]),
        ));
  }
}
