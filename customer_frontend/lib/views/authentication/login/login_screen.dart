import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/constant/components.dart';
import 'package:studio_projects/shared/validators.dart';
import 'package:studio_projects/views/authentication/login/login_bloc.dart';
import 'package:studio_projects/views/authentication/login/login_event.dart';

import '../../../shared/components/rounded_buttons.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isShowPassword = false;

  final _emailController = TextEditingController();
  bool _emailEnabled = true;

  final _passwordController = TextEditingController();
  bool _passwordEnabled = true;

  final _errorController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          print(state);
          if (state is LoginSuccess) {
            _emailEnabled = false;
            _passwordEnabled = false;

            Navigator.pushNamedAndRemoveUntil(
                context, 'main', (route) => false);
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text(
                  state.error,
                )));
          } else if (state is LoginEmailVerification) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'email_verification', (route) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "User Login",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter your account details to get started.",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("School Email"),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    hintText: "Enter your email...",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 2,
                          ),
                          child: Container(
                            padding:
                                EdgeInsetsDirectional.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Password"),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextField(
                                  controller: _passwordController,
                                  obscureText: !_isShowPassword,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: Icon(!_isShowPassword
                                            ? Icons.remove_red_eye
                                            : Icons.remove_red_eye_outlined),
                                        onPressed: () {
                                          setState(() {
                                            _isShowPassword = !_isShowPassword;
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
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("User Forgot Password");
                              Navigator.pushNamed(context, 'reset_password');
                            },
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: MaterialButton(
                              onPressed: () {
                                context.read<LoginBloc>().add(LoginButtonPressed(
                                    email: _emailController.text,
                                    password: _passwordController.text));

                                FocusScopeNode currentFocus = FocusScope.of(context);
                                currentFocus.unfocus();
                              },
                              child: Text("Login"),
                              color: Color.fromRGBO(237, 188, 161, 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(
                                      color: Color.fromRGBO(230, 140, 92, 1.0),
                                      width: 3,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                      style: BorderStyle.solid)),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, 'registration');
                                },
                                child: Container(
                                  child: Text(
                                    "Don't have an account? Sign up now!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
