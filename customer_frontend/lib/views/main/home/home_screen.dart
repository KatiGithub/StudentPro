import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/shared/components/discount_card.dart';
import 'package:studio_projects/shared/components/discount_card_grouper.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';

import '../../../models/discounts/discount.dart';
import 'home_state.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _homeState = context.watch<HomeCubit>().state;
    List<Discount> discounts = _homeState.discounts;

    return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 18.0), child: DiscountCardGrouper(discounts: discounts, context: context,),);
          },
        );
  }
}
