import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/retailers/retailer.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

import '../common_blocs/favorite/favorite_state.dart';

class RetailerCard extends StatelessWidget {
  Retailer retailer;
  BuildContext context;

  RetailerCard({required this.retailer, required this.context});

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(this.context);

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'retailer', arguments: retailer);
          },
          child: Material(
            elevation: 5.0,
            shadowColor: Colors.blueGrey,
            child: Container(
              decoration: BoxDecoration(
                  color: settingsBloc.state.settings!.darkMode!
                      ? Colors.black12
                      : Colors.grey),
              height: MediaQuery.of(context).size.height / 8.4,
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                      radius: 40,
                      child: ClipOval(
                          child: Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                'assets/food_test.jpg',
                                fit: BoxFit.cover,
                              )))),
                  SizedBox(
                    width: 10,
                  ),
                  Text(retailer.RetailerName!)
                ],
              ),
            ),
          ),
        ));
  }
}
