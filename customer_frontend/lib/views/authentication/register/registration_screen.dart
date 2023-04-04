import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/constant/components.dart';
import 'package:studio_projects/models/user.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';
import 'package:studio_projects/views/authentication/register/registration_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';
import 'package:studio_projects/views/authentication/register/steps/step1_screen.dart';
import 'package:studio_projects/views/authentication/register/steps/step2_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = 'registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentPage = 0;

  List<Widget> _steps = [RegistrationPage1(), RegistrationPage2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocProvider(
              create: (create) => RegistrationCubit(),
              child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                return _steps.elementAt(currentPage);
              }),
            )),
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
                  onPressed: currentPage < _steps.length - 1
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
