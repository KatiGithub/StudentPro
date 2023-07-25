import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_cubit.dart';
import 'package:studio_projects/shared/common_blocs/savedforlater/savedforlater_bloc.dart';
import 'package:studio_projects/shared/common_blocs/theme/theme_bloc.dart';
import 'package:studio_projects/views/authentication/authentication_screen.dart';
import 'package:studio_projects/views/authentication/login/login_screen.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';
import 'package:studio_projects/views/authentication/register/registration_screen.dart';
import 'package:studio_projects/views/authentication/reset_password/reset_password.dart';
import 'package:studio_projects/views/main/favorite/favorite_cubit.dart';
import 'package:studio_projects/views/main/home/home_cubit.dart';
import 'package:studio_projects/views/main/home/home_screen.dart';
import 'package:studio_projects/views/main/main_screen.dart';
import 'package:studio_projects/views/main/search/search_cubit.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_state.dart';
import 'package:studio_projects/views/retailer/retailer_screen.dart';
import 'package:studio_projects/views/main/search/search_screen.dart';
import 'package:studio_projects/views/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/src/widgets_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  
  FirebaseMessaging.instance.getToken()
    .then((String? token) {
      print("Token: $token");
  });
  
  FirebaseMessaging.instance
    .requestPermission()
    .then((NotificationSettings ntfSettings) {
      print(ntfSettings.authorizationStatus);
  });


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final goRoutes = GoRouter(initialLocation: "/welcome",
      routes: [
    GoRoute(
        path: '/welcome',
        name: WelcomeScreen.id,
        builder: (context, state) => WelcomeScreen()),
    GoRoute(
        path: "/main",
        name: MainScreen.id,
        builder: (context, state) => MainScreen(),
    ),
    GoRoute(
        path: "/retailer",
        name: RetailerScreen.id,
        builder: (context, state) => RetailerScreen(state.extra as Business)),
    GoRoute(
        path: "/login",
        name: LoginScreen.id,
        builder: (context, state) => LoginScreen()),
    GoRoute(
        path: "/register",
        name: RegistrationScreen.id,
        builder: (context, state) => RegistrationScreen()),
    GoRoute(
        path: "/email_verification",
        name: EmailVerification.id,
        builder: (context, state) => EmailVerification())
  ]);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DiscountBloc()),
        BlocProvider(create: (_) => FavoriteCubit()),
        BlocProvider(create: (_) => SavedForLaterBloc()),
        BlocProvider(create: (_) => SettingsBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => RegistrationCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => SearchCubit()),
        BlocProvider(create: (_) => RetailerCubit())
      ],
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          setState(() {});
        },
        builder: (context, state) {
          final settingsBloc = BlocProvider.of<SettingsBloc>(context);
          return MaterialApp.router(
            supportedLocales: [Locale("en"), Locale("th")],
            locale: Locale(settingsBloc.state.settings.languageId!),
            theme: ThemeData(
                fontFamily: 'SF_Pro',
                brightness: Brightness.light,
                appBarTheme:
                    AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(color: Colors.black12, elevation: 0)),
            themeMode: settingsBloc.state.settings.darkMode!
                ? ThemeMode.dark
                : ThemeMode.light,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            routerConfig: goRoutes,
          );
        },
      ),
    );
  }
}