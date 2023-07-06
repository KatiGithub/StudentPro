import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/discounts/discount_bloc.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: await getTemporaryDirectory());
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
        BlocProvider(create: (_) => FavoriteCubit()),
        BlocProvider(create: (_) => SavedForLaterBloc()),
        BlocProvider(create: (_) => SettingsBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => RegistrationCubit()),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => SearchCubit())
      ],
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) {
          setState(() {});
        },
        builder: (context, state) {
          final settingsBloc = BlocProvider.of<SettingsBloc>(context);
          return MaterialApp(
            navigatorObservers: [HeroController()],
            initialRoute: WelcomeScreen.id,
            routes: {
              WelcomeScreen.id: (context) => WelcomeScreen(),
              AuthenticationScreen.id: (context) => AuthenticationScreen(),
              LoginScreen.id: (context) => LoginScreen(),
              MainScreen.id: (context) => MainScreen(),
              RegistrationScreen.id: (context) => RegistrationScreen(),
              EmailVerification.id: (context) => EmailVerification(),
              SearchScreen.id: (context) => SearchScreen(),
              RetailerScreen.id: (context) => RetailerScreen(),
              ResetPasswordScreen.id: (context) => ResetPasswordScreen(),
              HomeScreen.id: (context) => HomeScreen()
            },
          );
        },
      ),
    );
  }
}
