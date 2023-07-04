import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/components/container_with_requested_image.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';

import '../common_blocs/favorite/favorite_state.dart';

class RetailerCard extends StatelessWidget {
  Business business;

  RetailerCard(this.business);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return ImageContainer(
      "/brand_banner_${this.business.businessId}",
      containerBackgroundColor: Colors.red,
      containerBorderRadius: BorderRadius.circular(20),
      containerChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(flex: 10, fit: FlexFit.tight, child: Container()),
          Flexible(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: ImageContainer(
                      "/brand_logo_${this.business.businessId}",
                      containerBorderRadius: BorderRadius.circular(15),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text("This is where the text goes."),
                  )
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
