import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/constant/components.dart';
import 'package:studio_projects/models/university.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';
import 'package:studio_projects/shared/university/university_bloc.dart';
import 'package:studio_projects/shared/university/university_event.dart';
import 'package:studio_projects/shared/university/university_state.dart';
import 'package:studio_projects/views/authentication/register/registration_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_event.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../../models/user.dart';

class RegistrationPage2 extends StatefulWidget {
  @override
  _RegistrationPage2State createState() => _RegistrationPage2State();
}

class _RegistrationPage2State extends State<RegistrationPage2> {
  List<University> _universitiesList = <University>[];
  int? _indexChosenUniversity = null;
  User _user = User();
  TextEditingController _schoolEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _registrationState = context.watch<RegistrationCubit>().state;

    _schoolEmailController.text =
    _registrationState.user.userCredentials.schoolEmail != null
        ? _registrationState.user.userCredentials.schoolEmail!
        : '';

    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40.0,
          child: BlocProvider(
            create: (create) => UniversityBloc(),
            child: BlocConsumer<UniversityBloc, UniversityState>(
              builder: (context, state) {
                if (_universitiesList.isEmpty) {
                  context.read<UniversityBloc>().add(OnGetUniversities());
                }
                return BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                    if (_registrationState.user.university != null) {
                      _indexChosenUniversity = _universitiesList
                          .indexOf(_registrationState.user.university!);
                    }

                    return GestureDetector(
                        child: DropdownButton(
                      value: _indexChosenUniversity == null
                          ? null
                          : _universitiesList
                              .elementAt(_indexChosenUniversity!),
                      hint: const Text("Choose University"),
                      items: _universitiesList
                          .map((university) => DropdownMenuItem<University>(
                                value: university,
                                child: Text(university.name!),
                              ))
                          .toList(),
                      onChanged: (University? value) {
                        _indexChosenUniversity =
                            _universitiesList.indexOf(value!);
                        setState(() {
                          _user.university = value;
                          BlocProvider.of<RegistrationCubit>(context)
                              .setUniversity(value!);
                        });
                      },
                    ));
                  },
                );
              },
              listener: (context, state) {
                if (state is UniversityStateRetrieveSuccessful) {
                  // setState(() {
                  // });
                  _universitiesList = state.listUniversities;
                }
              },
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 8,
                  child: Container(
                    width: 280.0,
                    child: TextField(
                      controller: _schoolEmailController,
                      onSubmitted: (String schoolEmail) {
                        BlocProvider.of<RegistrationCubit>(context)
                            .setSchoolEmail(schoolEmail);
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: "University/School Email",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black45, width: 10.0),
                              borderRadius: BorderRadius.circular(40.0))),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Flexible(
                  flex: 3,
                  child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30.0),
                      child: MaterialButton(
                        onPressed: () {},
                        height: 42.0,
                        child: const Text(
                          'Verify',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      )),
                )
              ],
            ))
      ],
    ));
  }
}
