import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

import '../common_blocs/favorite/favorite_state.dart';

class RetailerCard extends StatelessWidget {


  RetailerCard();

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 8, fit: FlexFit.tight, child: Container()),
          Flexible(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green,
                              boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 15)]),
                        ),
                      )),
                  Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("This is where the text goes."),
                      ))
                ],
              ),
            ),
          ),
          Flexible(flex: 1, fit: FlexFit.tight, child: Container()),
        ],
      ),
    );
  }
}
