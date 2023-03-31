import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'StudentPro',
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900
                    )
                  )
                ],
                repeatForever: false),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Image.asset('images/logo.png'),
                  height: 60.0,
                )
              ],
            )
        ),
      ),
    );
  }
}