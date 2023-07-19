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
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(
      width: 0.5
    )));

final kTextFieldDecorationFocused = InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
    filled: true,
    fillColor: Colors.white);
