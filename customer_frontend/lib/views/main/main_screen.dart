import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/settings.dart';
import 'package:studio_projects/views/main/favorite/favorite_screen.dart';
import 'package:studio_projects/views/main/savedforlater/savedforlater_screen.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';
import 'package:studio_projects/views/main/home/home_screen.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_screen.dart';

import 'home/home_state.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> pages = <Widget>[
    BlocProvider(
        create: (create) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return HomeScreen();
          },
        )),
    // SavedForLaterScreen(),
    FavoriteScreen(),
    SettingsScreen()
  ];

  int pageCount = 0;

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/typo_logo.png",
          width: MediaQuery.of(context).size.width / 5,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search,
                color: settingsBloc.state.settings.darkMode!
                    ? Colors.white
                    : Colors.black),
            onPressed: () {
              Navigator.of(context).pushNamed('search');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
        child: pages[pageCount],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: MediaQuery.of(context).size.height / 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    pageCount = 0;
                  });
                },
                icon: Icon(pageCount == 0 ? Icons.home : Icons.home_outlined)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pageCount = 1;
                  });
                },
                icon: Icon(
                    pageCount == 1 ? Icons.bookmark : Icons.bookmark_outline)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pageCount = 2;
                  });
                },
                icon: Icon(
                    pageCount == 2 ? Icons.favorite : Icons.favorite_outline)),
            IconButton(
                onPressed: () {
                  setState(() {
                    pageCount = 3;
                  });
                },
                icon: Icon(
                    pageCount == 3 ? Icons.settings : Icons.settings_outlined))
          ],
        ),
      ),
    );
  }
}
