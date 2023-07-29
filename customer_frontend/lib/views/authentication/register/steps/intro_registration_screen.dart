import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../main/main_screen.dart';

class IntroRegistrationScreen extends StatelessWidget {
  static final id = 'intro_registration';

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.grey,
      child: Stack(
        children: [
          Image.asset(
            "assets/test_fullscreen.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacementNamed(MainScreen.id);
                  },
                  child: Container(
                    width: 120,
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 40),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 166, 48, 1.0),
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
