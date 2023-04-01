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
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                  child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'images/logo.png',
                          height: 120.0,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _emailController,
                        validator: FormValidators.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => _formKey.currentState!.validate(),
                        decoration: kTextFieldDecoration.copyWith(
                            enabled: _emailEnabled,
                            hintText: 'Enter school email',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 10.0),
                                borderRadius: BorderRadius.circular(40.0))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        controller: _passwordController,
                        validator: FormValidators.passwordValidator,
                        onChanged: (value) => _formKey.currentState!.validate(),
                        keyboardType: TextInputType.name,
                        obscureText: true,
                        decoration: kTextFieldDecoration.copyWith(
                            enabled: _passwordEnabled,
                            hintText: 'Enter password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 10.0),
                                borderRadius: BorderRadius.circular(40.0))),
                      ),
                    ),
                    RoundedButton(
                      title: "Log In",
                      colour: Colors.blue,
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginButtonPressed(
                            email: _emailController.text,
                            password: _passwordController.text));

                        FocusScopeNode currentFocus = FocusScope.of(context);
                        currentFocus.unfocus();
                      },
                    ),
                  ],
                ),
              )),
            ),
          );
        },
      ),
    );
  }
}
