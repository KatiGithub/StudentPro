import 'package:flutter/material.dart';

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
                color: const Color.fromRGBO(241, 119, 32, 0.7),
                onPressed: () {},
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    child: Text("Continue to Main Screen"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
