import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/views/main/favorite/favorite_screen.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';
import 'package:studio_projects/views/main/home/home_screen.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_screen.dart';
import 'package:studio_projects/views/main/search/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'home/home_state.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main';

  @override
  _MainScreenState createState() => _MainScreenState();
}

final _homeNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
final _shellNavigatorFavoriteKey = GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

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
    SearchScreen(),
    SettingsScreen()
  ];

  int pageCount = 0;

  final goRouter = GoRouter(initialLocation: "/home", navigatorKey: _homeNavigatorKey, routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(navigatorKey: _shellNavigatorHomeKey, routes: <RouteBase>[
            GoRoute(path: "/home", builder: (BuildContext context, GoRouterStatestate) => HomeScreen())
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorSearchKey, routes: <RouteBase>[
            GoRoute(path: "/search", builder: (BuildContext context, GoRouterState state) => SearchScreen())
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorFavoriteKey, routes: <RouteBase>[
            GoRoute(path: "/favorite", builder: (BuildContext context, GoRouterState state) => FavoriteScreen())
          ]),
          StatefulShellBranch(navigatorKey: _shellNavigatorSettingsKey, routes: <RouteBase>[
            GoRoute(path: "/settings", builder: (BuildContext context, GoRouterState state) => SettingsScreen())
          ])
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
        backgroundColor: Colors.blue,
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
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }
}
