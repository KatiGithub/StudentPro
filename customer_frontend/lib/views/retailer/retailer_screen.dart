import 'package:flutter/material.dart';
import 'package:studio_projects/models/retailers/business.dart';

class RetailerScreen extends StatefulWidget {
  static const id = 'retailer';



  @override
  _StateRetailerScreen createState() => _StateRetailerScreen();
}

class _StateRetailerScreen extends State<RetailerScreen> {

  @override
  Widget build(BuildContext context) {
    Business business = ModalRoute.of(context)!.settings.arguments as Business;

    return Scaffold();
  }
}
