import 'package:flutter/material.dart';

class CouponDisplayPopup extends StatelessWidget {
  final String couponCode;

  CouponDisplayPopup({required this.couponCode});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Center(
        child: Text(couponCode),
      ),
    );
  }

}