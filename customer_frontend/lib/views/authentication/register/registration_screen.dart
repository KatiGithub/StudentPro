import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:studio_projects/constant/components.dart';
import 'package:studio_projects/models/user.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';
import 'package:studio_projects/views/authentication/register/registration_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';
import 'package:studio_projects/views/authentication/register/steps/intro_registration_screen.dart';
import 'package:studio_projects/views/authentication/register/steps/step1_screen.dart';
import 'package:studio_projects/views/authentication/register/steps/step2_screen.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentPage = 0;

  List<Widget> _steps = [IntroRegistrationScreen(),RegistrationPage1(), RegistrationPage2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: StepProgressIndicator(
              totalSteps: _steps.length,
              currentStep: currentPage + 1,
            ),
          ),
          SizedBox(
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentPage == 0 ? SizedBox.shrink() : Text("Registration", style: TextStyle(
                      fontSize: 30
                  ),),
                  currentPage == 0 ? SizedBox.shrink() : SizedBox(height: 100,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: BlocProvider(
                        create: (create) => RegistrationCubit(),
                        child:
                            BlocBuilder<RegistrationCubit, RegistrationState>(
                                builder: (context, state) {
                          return _steps.elementAt(currentPage);
                        }),
                      ))
                ],
              ))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: currentPage > 0
                    ? () {
                        setState(() {
                          currentPage -= 1;
                        });
                      }
                    : null,
                icon: Icon(Icons.arrow_back)),
            IconButton(
                onPressed: currentPage < 2
                    ? () {
                        setState(() {
                          currentPage += 1;
                        });
                      }
                    : null,
                icon: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
