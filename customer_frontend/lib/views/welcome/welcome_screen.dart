import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/login/login_screen.dart';
import 'package:studio_projects/views/welcome/welcome_bloc.dart';
import 'package:studio_projects/views/welcome/welcome_events.dart';
import 'package:studio_projects/views/welcome/welcome_state.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
        create: (BuildContext context) => WelcomeBloc(),
        child: Scaffold(
            body: BlocConsumer<WelcomeBloc, WelcomeState>(
              bloc: BlocProvider.of<WelcomeBloc>(context),
                listener: (context, state) {
          if (state is WelcomeLoginNotDone) {
            // Navigator.pushReplacementNamed(context, LoginScreen.id);
            print("Not logged in");
          } else if (state is WelcomeLoginDone) {
            print("Logged in. Redirecting to Home Page");
          }
        }, builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText('StudentPro',
                      textStyle: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.w900))
                ],
                    repeatForever: false,
                onFinished: () {
                  print("Finished Playing");
                  WelcomeBloc().add(OnFinishedPlaying());
                  print("Moving on");
                },),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                )
              ],
            )),
          );
        })));
  }
}
