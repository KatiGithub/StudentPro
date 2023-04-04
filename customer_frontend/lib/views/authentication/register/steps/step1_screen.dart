import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_event.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../../constant/components.dart';

class RegistrationPage1 extends StatefulWidget {
  @override
  _RegistrationPage1State createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  DateTime _selectedDate = DateTime.now();
  bool _datePickerIsPressed = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personalEmailController =
      TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        BlocProvider.of<RegistrationCubit>(context).setDateOfBirth(
            DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day)
                    .millisecondsSinceEpoch /
                1000);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _registrationState = context.watch<RegistrationCubit>().state;
    _firstNameController.text = _registrationState.user.firstName != null
        ? _registrationState.user.firstName!
        : '';

    _lastNameController.text = _registrationState.user.lastName != null
        ? _registrationState.user.lastName!
        : '';

    _personalEmailController.text =
        _registrationState.user.personalEmail != null
            ? _registrationState.user.personalEmail!
            : '';

    return BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(
                    flex: 4,
                    child: TextField(
                      controller: _firstNameController,
                      onSubmitted: (value) =>
                          BlocProvider.of<RegistrationCubit>(context)
                              .setFirstName(_firstNameController.text),
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'First Name',
                        hintStyle: TextStyle(fontSize: 16.0),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black45, width: 10.0),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                    )),
                SizedBox(width: 8.0),
                Flexible(
                    flex: 8,
                    child: TextField(
                      onSubmitted: (value) =>
                          BlocProvider.of<RegistrationCubit>(context)
                              .setLastName(_lastNameController.text),
                      controller: _lastNameController,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Last Name',
                          hintStyle: TextStyle(fontSize: 16.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black45, width: 10.0),
                              borderRadius: BorderRadius.circular(40.0))),
                    )),
              ],
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _personalEmailController,
              onSubmitted: (value) {
                BlocProvider.of<RegistrationCubit>(context)
                    .setPersonalEmail(_personalEmailController.text);
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Personal (Non-School) E-mail",
                  hintStyle: TextStyle(fontSize: 16.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 10.0),
                      borderRadius: BorderRadius.circular(40.0))),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: MaterialButton(
                  height: 42,
                  minWidth: 280,
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black45),
                      borderRadius: BorderRadius.circular(40.0)),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: _registrationState.user.dateOfBirth! == 0
                      ? const Text("Date of Birth")
                      : Text(DateTime.fromMillisecondsSinceEpoch(
                              _registrationState.user.dateOfBirth!.toInt() *
                                  1000)
                          .toString()
                          .substring(
                              0,
                              DateTime.fromMillisecondsSinceEpoch(
                                      _registrationState.user.dateOfBirth!
                                              .toInt() *
                                          1000)
                                  .toString()
                                  .indexOf(" "))),
                )),
          ],
        ),
      );
    });
  }
}
