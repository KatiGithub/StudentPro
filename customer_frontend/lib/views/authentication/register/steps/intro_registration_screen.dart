import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../main/main_screen.dart';

class IntroRegistrationScreen extends StatelessWidget {
  static final id = 'intro_registration';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [
          Image.asset(
            "assets/test_fullscreen.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 10,
              right: 20,
              child: MaterialButton(
                color: const Color.fromRGBO(255, 166, 48, 1.0),
                onPressed: () {
                  GoRouter.of(context).pushReplacementNamed(MainScreen.id);
                },
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    child: Icon(Icons.arrow_forward_sharp, color: Colors.white,),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
