import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  hintStyle: TextStyle(fontSize: 20.0),
  labelStyle: TextStyle(fontSize: 20.0),
  errorStyle: TextStyle(
    fontSize: 14,
    color: Colors.red,
  ),
);
const Color kBlack45Color = Color(0x73000000);

final kTextFieldDecorationUnfocused = InputDecoration(
    fillColor: Color.fromRGBO(209, 205, 205, 1),
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(width: 0, color: Colors.white)
    ));

final kTextFieldDecorationFocused =
    InputDecoration(border: GradientOutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
        gradient: RadialGradient(
          radius: 1,
            colors: [
              Color.fromRGBO(246, 169, 51, 1),
              Colors.white
            ]
        ))
    );
