import 'package:flutter/material.dart';
import 'package:studio_projects/views/authentication/authentication_screen.dart';
import 'package:studio_projects/views/authentication/login/login_screen.dart';
import 'package:studio_projects/views/authentication/register/email_verification.dart';
import 'package:studio_projects/views/authentication/register/registration_screen.dart';
import 'package:studio_projects/views/main/main_screen.dart';
import 'package:studio_projects/views/search/search_screen.dart';
import 'package:studio_projects/views/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final directory = await getTemporaryDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        AuthenticationScreen.id: (context) => AuthenticationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        EmailVerification.id: (context) => EmailVerification(),
        SearchScreen.id: (context) => SearchScreen()
      },
    );
  }
}
