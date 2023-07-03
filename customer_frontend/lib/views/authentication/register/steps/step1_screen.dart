import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';

import '../../../../constant/components.dart';

class RegistrationPage1 extends StatefulWidget {
  @override
  _RegistrationPage1State createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  late String firstName;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personalEmailController = TextEditingController();
  final TextEditingController _schoolEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  DateTime _selectedDate = DateTime(1970);
  bool dateChanged = false;

  bool _obscureText = true;

  void _selectDate(DateTime? dateTime) {
    setState(() {
      _selectedDate = dateTime!;
    });
  }

  final _focusNodeFirstName = FocusNode();
  final _focusNodeLastName = FocusNode();
  final _focusNodePersonalEmail = FocusNode();
  final _focusNodeSchoolEmail = FocusNode();
  final _focusNodePassword = FocusNode();

  bool _isFocusedFirstName = false;
  bool _isFocusedLastName = false;
  bool _isFocusedPersonalEmail = false;
  bool _isFocusedSchoolEmail = false;
  bool _isFocusedPassword = false;

  void _handleFocusChangeFirstName() {
    setState(() {
      _isFocusedFirstName = _focusNodeFirstName.hasFocus;
    });
  }

  void _handleFocusChangeLastName() {
    setState(() {
      _isFocusedLastName = _focusNodeLastName.hasFocus;
    });
  }

  void _handleFocusChangePersonalEmail() {
    setState(() {
      _isFocusedPersonalEmail = _focusNodePersonalEmail.hasFocus;
    });
  }

  void _handleFocusChangeSchoolEmail() {
    setState(() {
      _isFocusedSchoolEmail = _focusNodeSchoolEmail.hasFocus;
    });
  }

  void _handleFocusChangePassword() {
    setState(() {
      _isFocusedPassword = _focusNodePassword.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    _focusNodeFirstName.addListener(_handleFocusChangeFirstName);
    _focusNodeLastName.addListener(_handleFocusChangeLastName);
    _focusNodePersonalEmail.addListener(_handleFocusChangePersonalEmail);
    _focusNodeSchoolEmail.addListener(_handleFocusChangeSchoolEmail);
    _focusNodePassword.addListener(_handleFocusChangePassword);
  }

  @override
  Widget build(BuildContext context) {
    final _registrationState = context.watch<AuthCubit>().state;

    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegistrationError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            //
            // _firstNameController.clear();
            // _lastNameController.clear();
            // _personalEmailController.clear();
            // _schoolEmailController.clear();
            // _passwordController.clear();
          } else if (state is EmailVerificationNeeded) {
            Navigator.pushNamedAndRemoveUntil(context, 'email_verification', (route) => false);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Center(
                    child: Text(
                      "Registration",
                      style: TextStyle(fontSize: 40),
                    ),
                  )),
              Flexible(
                  flex: 9,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text("First Name"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                                        _focusNodeFirstName.hasFocus
                                            ? BoxShadow(
                                                color: Colors.pinkAccent.withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                              )
                                            : const BoxShadow()
                                      ]),
                                      child: TextField(
                                          controller: _firstNameController,
                                          focusNode: _focusNodeFirstName,
                                          decoration: !_focusNodeFirstName.hasFocus
                                              ? kTextFieldDecorationUnfocused
                                              : kTextFieldDecorationFocused)),
                                ],
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text("Last Name"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                                      _focusNodeLastName.hasFocus
                                          ? BoxShadow(
                                              color: Colors.pinkAccent.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          : const BoxShadow()
                                    ]),
                                    child: TextField(
                                        controller: _lastNameController,
                                        focusNode: _focusNodeLastName,
                                        decoration: !_focusNodeLastName.hasFocus
                                            ? kTextFieldDecorationUnfocused
                                            : kTextFieldDecorationFocused),
                                  )
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Personal Email"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                              _focusNodePersonalEmail.hasFocus
                                  ? BoxShadow(
                                      color: Colors.pinkAccent.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    )
                                  : const BoxShadow()
                            ]),
                            child: TextField(
                                controller: _personalEmailController,
                                focusNode: _focusNodePersonalEmail,
                                decoration: !_focusNodePersonalEmail.hasFocus
                                    ? kTextFieldDecorationUnfocused
                                    : kTextFieldDecorationFocused),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("School Email"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                              _focusNodeSchoolEmail.hasFocus
                                  ? BoxShadow(
                                      color: Colors.pinkAccent.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    )
                                  : const BoxShadow()
                            ]),
                            child: TextField(
                                controller: _schoolEmailController,
                                focusNode: _focusNodeSchoolEmail,
                                decoration: !_focusNodeSchoolEmail.hasFocus
                                    ? kTextFieldDecorationUnfocused
                                    : kTextFieldDecorationFocused),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Password"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [
                                _focusNodePassword.hasFocus
                                    ? BoxShadow(
                                        color: Colors.pinkAccent.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    : const BoxShadow()
                              ]),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                focusNode: _focusNodePassword,
                                decoration: !_focusNodePassword.hasFocus
                                    ? kTextFieldDecorationUnfocused.copyWith(
                                        suffixIcon: IconButton(
                                          splashRadius: 20,
                                          icon: Icon(
                                            _obscureText ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.redAccent,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      )
                                    : kTextFieldDecorationFocused.copyWith(
                                        suffixIcon: IconButton(
                                          splashRadius: 20,
                                          icon: Icon(
                                            _obscureText ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.redAccent,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = !_obscureText;
                                            });
                                          },
                                        ),
                                      ),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                          color: Colors.black54.withOpacity(0.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            height: 50,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.calendar_month_outlined),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    !dateChanged
                                        ? const Text("Date of Birth")
                                        : Text(DateFormat('MMMM d yyyy').format(_selectedDate))
                                  ],
                                ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            CupertinoRoundedDatePicker.show(context,
                                initialDate: _selectedDate,
                                minimumYear: 1970,
                                maximumYear: 2023, onDateTimeChanged: (DateTime dateTime) {
                              dateChanged = true;
                              _selectDate(dateTime);
                            });
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          _updateFirstName(_firstNameController.text, context);
                          _updateLastName(_lastNameController.text, context);
                          _updatePersonalEmail(_personalEmailController.text, context);
                          _updateSchoolEmail(_schoolEmailController.text, context);
                          _updatePassword(_passwordController.text, context);
                          _updateDateOfBirth(_selectedDate.millisecondsSinceEpoch / 1000, context);

                          BlocProvider.of<AuthCubit>(context).submitLoginInformation();

                          FocusScopeNode currentFocus = FocusScope.of(context);
                          currentFocus.unfocus();
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                  child: Text(
                                "Sign Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }

  _updateFirstName(String firstName, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.user.firstName = firstName;
  }

  _updateLastName(String lastName, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.user.lastName = lastName;
  }

  _updatePersonalEmail(String personalEmail, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.user.personalEmail = personalEmail;
  }

  _updateDateOfBirth(double dateOfBirth, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.user.dateOfBirth = dateOfBirth;
  }

  _updateSchoolEmail(String schoolEmail, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.user.schoolEmail = schoolEmail;
  }

  _updatePassword(String password, BuildContext context) {
    BlocProvider.of<AuthCubit>(context).state.password = password;
  }
}
