import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayModalBottomSheet(BuildContext context, Widget content) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: content,
        );
      }
  );
}