import 'package:business_frontend/shared/common_blocs/auth/auth_cubit.dart';
import 'package:business_frontend/shared/constants/decorations.dart';
import 'package:business_frontend/views/authentication/activation_code_input/activation_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';

  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Admin Web Portal",
          style: TextStyle(fontSize: 50),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: SizedBox.shrink(),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Email"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: kTextFieldDecoration,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Password"),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: true,
                                  controller: passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: kTextFieldDecoration,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CupertinoButton(
                                    color: const Color.fromRGBO(255, 166, 48, 1.0),
                                    child: const Text("Login"),
                                    onPressed: () {
                                      BlocProvider.of<AuthCubit>(context)
                                          .login(emailController.text, passwordController.text);
                                    })
                              ],
                            )),
                        Flexible(
                            flex: 2,
                            child: Column(
                              children: [
                                Text("Have an activation code?"),
                                CupertinoButton(child: Text("Sign up here"), onPressed: () {
                                  context.pushNamed(ActivationCodeScreen.id);
                                })
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              const Flexible(
                flex: 4,
                fit: FlexFit.tight,
                child: SizedBox.shrink(),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
