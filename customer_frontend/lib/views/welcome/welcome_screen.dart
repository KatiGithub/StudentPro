import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            print(state);
            if (state is LoginSucess) {
              Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
              print("Logged in. Redirecting to Home Page");
            } else {
              Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
              print("Not logged in");
            }
          },
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText('StudentPro',
                          textStyle: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900))
                    ],
                    repeatForever: false,
                    onFinished: () {
                      print("Finished Playing");
                      BlocProvider.of<AuthCubit>(context).checkLoggedIn();
                      print("Moving on");
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                      child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      height: 60.0,
                      'images/logo.png',
                    ),
                  ))
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
