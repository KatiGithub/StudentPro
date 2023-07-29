import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';

import '../../../../constant/components.dart';

class RegistrationPage1 extends StatefulWidget {
  @override
  _RegistrationPage1State createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  late String firstName;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personalEmailController =
      TextEditingController();
  final TextEditingController _schoolEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  bool dateChanged = false;

  bool _obscureText = true;

  void _selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
        context: context,
        builder: (context) {
          DateTime tempPickedDate = DateTime.now();
          return Container(
            height: 400,
            child: Column(
              children: [
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        }),
                    CupertinoButton(
                        child: const Text("Done"),
                        onPressed: () {
                          this.dateChanged = true;
                          GoRouter.of(context).pop(tempPickedDate);
                        })
                  ],
                )),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: CupertinoDatePicker(
                      initialDateTime: _selectedDate,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime dateTime) {
                        tempPickedDate = dateTime;
                      }),
                )
              ],
            ),
          );
        });

    bool isBefore = pickedDate!.isBefore(DateTime.now());

    if (isBefore) {
      setState(() {
        _selectedDate = pickedDate;
        print(pickedDate);
      });
    }
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
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is EmailVerificationNeeded) {
            GoRouter.of(context).pushReplacementNamed(EmailVerification.id);
          }
        },
        child: GestureDetector(
          onTap: () {
            FocusNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 80,),
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 40),
                          ),
                          Opacity(
                              opacity: 0.5,
                              child: Text(
                                  "Enter your details to create a StudentPro account"))
                        ],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Text("First Name"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                _focusNodeFirstName.hasFocus
                                                    ? const BoxShadow(
                                                        color: Color.fromRGBO(
                                                            255, 166, 48, 1.0),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                      )
                                                    : const BoxShadow()
                                              ]),
                                          child: TextField(
                                              controller: _firstNameController,
                                              focusNode: _focusNodeFirstName,
                                              decoration: !_focusNodeFirstName
                                                      .hasFocus
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      const Text("Last Name"),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              _focusNodeLastName.hasFocus
                                                  ? BoxShadow(
                                                      color: Color.fromRGBO(
                                                          241, 119, 32, 1),
                                                      spreadRadius: 2,
                                                      blurRadius: 5,
                                                    )
                                                  : const BoxShadow()
                                            ]),
                                        child: TextField(
                                            controller: _lastNameController,
                                            focusNode: _focusNodeLastName,
                                            decoration: !_focusNodeLastName
                                                    .hasFocus
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      _focusNodePersonalEmail.hasFocus
                                          ? BoxShadow(
                                              color: Color.fromRGBO(
                                                  241, 119, 32, 1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          : const BoxShadow()
                                    ]),
                                child: TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _personalEmailController,
                                    focusNode: _focusNodePersonalEmail,
                                    decoration:
                                        !_focusNodePersonalEmail.hasFocus
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      _focusNodeSchoolEmail.hasFocus
                                          ? const BoxShadow(
                                              color: Color.fromRGBO(
                                                  241, 119, 32, 1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                            )
                                          : const BoxShadow()
                                    ]),
                                child: TextField(
                                    keyboardType: TextInputType.emailAddress,
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
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        _focusNodePassword.hasFocus
                                            ? BoxShadow(
                                                color: Color.fromRGBO(
                                                    247, 170, 50, 1),
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
                                        ? kTextFieldDecorationUnfocused
                                            .copyWith(
                                            suffixIcon: IconButton(
                                              splashRadius: 20,
                                              icon: Icon(
                                                _obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
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
                                                _obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text("Date of Birth"),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  _selectDate();
                                },
                                child: AbsorbPointer(
                                  ignoringSemantics: true,
                                  child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: kTextFieldDecorationUnfocused
                                          .copyWith(
                                              hintText: dateChanged
                                                  ? DateFormat("MMMM d yyyy")
                                                      .format(_selectedDate)
                                                  : "")),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CupertinoButton(
                            color: const Color.fromRGBO(255, 166, 48, 1.0),
                            borderRadius: BorderRadius.circular(12),
                            onPressed: () {
                              _updateFirstName(
                                  _firstNameController.text, context);
                              _updateLastName(
                                  _lastNameController.text, context);
                              _updatePersonalEmail(
                                  _personalEmailController.text, context);
                              _updateSchoolEmail(
                                  _schoolEmailController.text, context);
                              _updatePassword(
                                  _passwordController.text, context);
                              _updateDateOfBirth(
                                  _selectedDate.millisecondsSinceEpoch / 1000,
                                  context);

                              BlocProvider.of<AuthCubit>(context)
                                  .submitLoginInformation();

                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              currentFocus.unfocus();
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20),
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
    BlocProvider.of<AuthCubit>(context).state.user.personalEmail =
        personalEmail;
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
