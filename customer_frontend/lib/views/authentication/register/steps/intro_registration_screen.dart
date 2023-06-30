import 'package:flutter/material.dart';

class IntroRegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Image.asset("assets/test_fullscreen.jpg", fit: BoxFit.cover,),
    );
  }

}