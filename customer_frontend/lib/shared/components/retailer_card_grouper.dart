import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/components/retailer_card.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

import '../../models/retailers/retailer.dart';

class RetailerCardGrouper extends StatelessWidget {
  List<Retailer> retailers;
  BuildContext context;

  RetailerCardGrouper({required this.retailers, required this.context});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: retailers.length,
        itemBuilder: (BuildContext context, int index) {
      return RetailerCard(retailer: retailers[index], context: this.context,);
    });
  }
}
