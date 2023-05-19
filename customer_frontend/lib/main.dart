import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
import 'package:studio_projects/shared/common_blocs/favorite/favorite_bloc.dart';
import 'package:studio_projects/shared/common_blocs/savedforlater/savedforlater_bloc.dart';
import 'package:studio_projects/shared/common_blocs/theme/theme_bloc.dart';
import 'package:studio_projects/views/authentication/authentication_screen.dart';
import 'package:studio_projects/views/authentication/login/login_screen.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';
import 'package:studio_projects/views/authentication/register/registration_screen.dart';
import 'package:studio_projects/views/main/main_screen.dart';
import 'package:studio_projects/views/main/settings/settings_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_state.dart';
import 'package:studio_projects/views/retailer/retailer_screen.dart';
import 'package:studio_projects/views/search/search_screen.dart';
import 'package:studio_projects/views/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  print("Token: ");
  print(await FirebaseMessaging.instance.getToken());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DiscountBloc()),
        BlocProvider(create: (_) => FavoriteBloc()),
        BlocProvider(create: (_) => SavedForLaterBloc()),
        BlocProvider(create: (_) {
          final settingsBloc = SettingsBloc();
          // settingsBloc.hydrate();
          return settingsBloc;
        }),
        BlocProvider(create: (_) => ThemeBloc())
      ],
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          setState(() {});
        },
        builder: (context, state) {
          final settingsBloc = BlocProvider.of<SettingsBloc>(context);
          return MaterialApp(
            navigatorObservers: [HeroController()],
            theme: ThemeData(
              fontFamily: 'SF_Pro',
                brightness: Brightness.light,
                appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                appBarTheme: AppBarTheme(color: Colors.black12, elevation: 0)),
            themeMode: settingsBloc.state.settings.darkMode!
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [Locale("en"), Locale("th")],
            locale: Locale(settingsBloc.state.settings.languageId!),
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              AuthenticationScreen.id: (context) => AuthenticationScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              MainScreen.id: (context) => MainScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              EmailVerification.id: (context) => EmailVerification(),
              SearchScreen.id: (context) => SearchScreen(),
              RetailerScreen.id: (context) => RetailerScreen()
            },
          );
        },
      ),
    );
  }
}
