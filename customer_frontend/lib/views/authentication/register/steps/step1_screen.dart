import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_event.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../../constant/components.dart';
import '../../../../models/university.dart';
import '../../../../models/user.dart';
import '../../../../shared/common_blocs/university/university_bloc.dart';
import '../../../../shared/common_blocs/university/university_event.dart';
import '../../../../shared/common_blocs/university/university_state.dart';
import '../../../../shared/components/rounded_buttons.dart';

class RegistrationPage1 extends StatefulWidget {
  @override
  _RegistrationPage1State createState() => _RegistrationPage1State();
}

class _RegistrationPage1State extends State<RegistrationPage1> {
  DateTime _selectedDate = DateTime.now();
  bool _datePickerIsPressed = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _personalEmailController = TextEditingController();

  List<University> _universitiesList = <University>[];
  int? _indexChosenUniversity;
  final User _user = User();
  bool _obscureText = true;

  final TextEditingController _schoolEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day).millisecondsSinceEpoch / 1000);
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

  @override void initState() {
    super.initState();
    _focusNodeFirstName.addListener(_handleFocusChangeFirstName);
    _focusNodeLastName.addListener(_handleFocusChangeLastName);
    _focusNodePersonalEmail.addListener(_handleFocusChangePersonalEmail);
    _focusNodeSchoolEmail.addListener(_handleFocusChangeSchoolEmail);
    _focusNodePassword.addListener(_handleFocusChangePassword);
  }
  
  @override
  Widget build(BuildContext context) {
    final _registrationState = context.watch<RegistrationCubit>().state;
    _firstNameController.text = _registrationState.user.firstName != null ? _registrationState.user.firstName! : '';

    _lastNameController.text = _registrationState.user.lastName != null ? _registrationState.user.lastName! : '';

    _personalEmailController.text =
        _registrationState.user.personalEmail != null ? _registrationState.user.personalEmail! : '';
    _schoolEmailController.text = _registrationState.user.userCredentials.schoolEmail != null
        ? _registrationState.user.userCredentials.schoolEmail!
        : '';

    _passwordController.text = _registrationState.user.userCredentials.password != null
        ? _registrationState.user.userCredentials.password!
        : '';

    return BlocBuilder<RegistrationCubit, RegistrationState>(builder: (context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("First Name"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          focusNode: _focusNodeFirstName,
                          controller: _firstNameController,
                          onTapOutside: (event) =>
                              BlocProvider.of<RegistrationCubit>(context).setFirstName(_firstNameController.text),
                          decoration: kTextFieldDecoration.copyWith(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black45, width: 10.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(width: 8.0),
                Flexible(
                    flex: 9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Last Name"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          focusNode: _focusNodeLastName,
                          onTapOutside: (event) =>
                              BlocProvider.of<RegistrationCubit>(context).setLastName(_lastNameController.text),
                          controller: _lastNameController,
                          decoration: kTextFieldDecoration.copyWith(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black45, width: 10.0),
                                  borderRadius: BorderRadius.circular(12.0))),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Email"),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  focusNode: _focusNodePersonalEmail,
                  controller: _personalEmailController,
                  onTapOutside: (value) {
                    BlocProvider.of<RegistrationCubit>(context).setPersonalEmail(_personalEmailController.text);
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    currentFocus.unfocus();
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 10.0),
                          borderRadius: BorderRadius.circular(12.0))),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    // color: Colors.grey,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black45, width: 2), borderRadius: BorderRadius.circular(12.0)),
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: _registrationState.user.dateOfBirth! == 0
                        ? const Text(
                            "Date of Birth",
                            style: TextStyle(color: Colors.black45),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date of Birth: ",
                                style: TextStyle(color: Colors.black45, fontSize: 16.0),
                              ),
                              Text(
                                DateTime.fromMillisecondsSinceEpoch(_registrationState.user.dateOfBirth!.toInt() * 1000)
                                    .toString()
                                    .substring(
                                        0,
                                        DateTime.fromMillisecondsSinceEpoch(
                                                _registrationState.user.dateOfBirth!.toInt() * 1000)
                                            .toString()
                                            .indexOf(" ")),
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ))),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 200),
              child: BlocListener<RegistrationCubit, RegistrationState>(
                  listener: (context, state) {
                    if (state is RegistrationError) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                    } else if (state is RegistrationEmailVerification) {
                      Navigator.pushNamedAndRemoveUntil(context, 'email_verification', (route) => false);
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 40.0,
                      //   child: BlocProvider(
                      //     create: (create) => UniversityBloc(),
                      //     child: BlocConsumer<UniversityBloc, UniversityState>(
                      //       builder: (context, state) {
                      //         if (_universitiesList.isEmpty) {
                      //           context.read<UniversityBloc>().add(OnGetUniversities());
                      //         }
                      //         return BlocBuilder<RegistrationCubit, RegistrationState>(
                      //           builder: (context, state) {
                      //             if (_registrationState.user.university != null) {
                      //               _indexChosenUniversity =
                      //                   _universitiesList.indexOf(_registrationState.user.university!);
                      //             }
                      //             return GestureDetector(
                      //                 child: DropdownButton(
                      //               value: _indexChosenUniversity == null
                      //                   ? null
                      //                   : _universitiesList.elementAt(_indexChosenUniversity!),
                      //               hint: const Text("Choose University"),
                      //               items: _universitiesList
                      //                   .map((university) => DropdownMenuItem<University>(
                      //                         value: university,
                      //                         child: Text(university.name!),
                      //                       ))
                      //                   .toList(),
                      //               onChanged: (University? value) {
                      //                 _indexChosenUniversity = _universitiesList.indexOf(value!);
                      //                 setState(() {
                      //                   _user.university = value;
                      //                   BlocProvider.of<RegistrationCubit>(context).setUniversity(value);
                      //                 });
                      //               },
                      //             ));
                      //           },
                      //         );
                      //       },
                      //       listener: (context, state) {
                      //         if (state is UniversityStateRetrieveSuccessful) {
                      //           _universitiesList = state.listUniversities;
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("School Email"),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              focusNode: _focusNodeSchoolEmail,
                              controller: _schoolEmailController,
                              onSubmitted: (event) {
                                BlocProvider.of<RegistrationCubit>(context).setSchoolEmail(_schoolEmailController.text);
                              },
                              decoration: _isFocusedSchoolEmail ? kTextFieldDecorationFocused : kTextFieldDecorationUnfocused
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Password"),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              focusNode: _focusNodePassword,
                              controller: _passwordController,
                              keyboardType: TextInputType.name,
                              obscureText: _obscureText,
                              onSubmitted: (event) {
                                BlocProvider.of<RegistrationCubit>(context).setPassword(_passwordController.text);
                              },
                              onTapOutside: (event) {
                                BlocProvider.of<RegistrationCubit>(context).setPassword(_passwordController.text);
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                enabled: true,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.black45, width: 10.0),
                                    borderRadius: BorderRadius.circular(12.0)),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RoundedButton(
                        title: "Sign Up",
                        colour: Colors.blue,
                        onPressed: () {
                          BlocProvider.of<RegistrationCubit>(context).submitLoginInformation();

                          FocusScopeNode currentFocus = FocusScope.of(context);
                          currentFocus.unfocus();
                        },
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    });
  }
}
