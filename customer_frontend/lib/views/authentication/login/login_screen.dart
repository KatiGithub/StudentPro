import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/shared/components/CustomTextField_Rounded.dart';
import 'package:studio_projects/shared/utils/location/location_util.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';
import 'package:studio_projects/views/authentication/register/registration_screen.dart';
import 'package:studio_projects/views/authentication/reset_password/reset_password.dart';
import 'package:studio_projects/views/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isShowPassword = false;

  final _emailController = TextEditingController();
  bool _emailEnabled = true;

  final _passwordController = TextEditingController();
  bool _passwordEnabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          print(state);
          if (state is LoginSucess) {
            _emailEnabled = false;
            _passwordEnabled = false;

            LocationUtil.requestUserPermission().then((_) {
              GoRouter.of(context).pushReplacementNamed(MainScreen.id);
            });
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  state.error,
                )));
          } else if (state is EmailVerificationNeeded) {
            GoRouter.of(context).pushReplacementNamed(EmailVerification.id);
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 35),
                width: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 80,),
                    const Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to StudentPro,",
                            style: TextStyle(fontSize: 30),
                          ),
                          Opacity(
                            opacity: 0.5,
                            child: Text("Log in to your account"),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 9,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("School Email"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextFieldRounded(
                                      "Enter your email...", _emailController),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 2,
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Password"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    TextField(
                                      controller: _passwordController,
                                      obscureText: !_isShowPassword,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                            icon: Icon(!_isShowPassword
                                                ? Icons.remove_red_eye
                                                : Icons
                                                    .remove_red_eye_outlined),
                                            onPressed: () {
                                              setState(() {
                                                _isShowPassword =
                                                    !_isShowPassword;
                                              });
                                            },
                                          ),
                                          hintText: "Enter your password...",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("User Forgot Password");
                                      GoRouter.of(context)
                                          .pushNamed(ResetPasswordScreen.id);
                                    },
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 55,
                                    child: CupertinoButton(
                                      onPressed: () {
                                        BlocProvider.of<AuthCubit>(context)
                                                .state
                                                .user
                                                .schoolEmail =
                                            _emailController.text;
                                        BlocProvider.of<AuthCubit>(context)
                                                .state
                                                .password =
                                            _passwordController.text;
                                        BlocProvider.of<AuthCubit>(context)
                                            .login();

                                        FocusScopeNode currentFocus =
                                            FocusScope.of(context);
                                        currentFocus.unfocus();
                                      },
                                      color: const Color.fromRGBO(255, 166, 48, 1.0),
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        height: 55,
                                        child: const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: Text(
                                              "Login",
                                              textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          GoRouter.of(context)
                                              .pushNamed(RegistrationScreen.id);
                                        },
                                        child: Container(
                                          child: const Row(
                                            children: [
                                              Text(
                                                "Don't have an account? ",
                                                style: TextStyle(
                                                    fontSize: 16),
                                              ),
                                              Text("Sign Up",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
