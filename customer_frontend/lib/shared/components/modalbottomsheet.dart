import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayModalBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
      context: context,
      builder: (BuildContext context) {
        return content;
      }
  );
}