import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/views/main/favorite/favorite_screen.dart';
import 'package:studio_projects/views/main/home/home_screen.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_screen.dart';
import 'package:studio_projects/views/main/search/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:studio_projects/views/retailer/retailer_screen.dart';

final _globalNavigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatelessWidget {

  static String id = "main";
  final goRouter = GoRouter(initialLocation: "/home" , navigatorKey: _globalNavigatorKey, routes: [
    GoRoute(
        path: "/retailer",
        builder: (BuildContext context, GoRouterState state) {
          return RetailerScreen(state.extra as Business);
        }),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch( routes: <RouteBase>[
            GoRoute(path: "/home", builder: (BuildContext context, GoRouterState state) => HomeScreen())
          ]),
          StatefulShellBranch( routes: <RouteBase>[
            GoRoute(path: "/search", builder: (BuildContext context, GoRouterState state) => SearchScreen())
          ]),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(path: "/favorite", builder: (BuildContext context, GoRouterState state) => FavoriteScreen())
          ]),
          StatefulShellBranch(routes: <RouteBase>[
            GoRoute(path: "/settings", builder: (BuildContext context, GoRouterState state) => SettingsScreen())
          ]),
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return MaterialApp.router(
      supportedLocales: [Locale("en"), Locale("th")],
      locale: Locale(settingsBloc.state.settings.languageId!),
      theme: ThemeData(
          fontFamily: 'SF_Pro',
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
      darkTheme: ThemeData(brightness: Brightness.dark, appBarTheme: AppBarTheme(color: Colors.black12, elevation: 0)),
      themeMode: settingsBloc.state.settings.darkMode! ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      routerConfig: goRouter,
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  ScaffoldWithNavBar(this.navigationShell);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.saved_search),
              label: "Search",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              activeIcon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.black)
        ],
        onTap: (int index) => _onTap(context, index),
        currentIndex: navigationShell.currentIndex,
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    print(index);
    print(navigationShell.currentIndex);
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
    if (index == 0) {
      GoRouter.of(context).go("/home");
    }
  }
}
