import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/models/retailers/business_post.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_event.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_event.dart';

import '../../shared/common_blocs/favorite/favorite_state.dart';
import '../../shared/common_blocs/retailer/retailer_bloc.dart';
import '../../shared/common_blocs/retailer/retailer_state.dart';

class RetailerScreen extends StatefulWidget {
  static const id = 'retailer';

  @override
  _StateRetailerScreen createState() => _StateRetailerScreen();
}

class _StateRetailerScreen extends State<RetailerScreen> {
  Business getRetailerFromNavigator(BuildContext context) {
    return ModalRoute.of(context)!.settings!.arguments as Business;
  }

  late Business retailer;
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
