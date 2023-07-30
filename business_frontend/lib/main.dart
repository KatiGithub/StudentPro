import 'dart:js';

import 'package:business_frontend/firebase_options.dart';
import 'package:business_frontend/shared/common_blocs/auth/auth_cubit.dart';
import 'package:business_frontend/views/authentication/login/login_screen.dart';
import 'package:business_frontend/views/main_screen.dart';
import 'package:business_frontend/views/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routes = GoRouter(initialLocation: '/welcome', routes: [
    GoRoute(
        path: "/welcome",
        name: WelcomeScreen.id,
        builder: (context, state) => WelcomeScreen()),
    GoRoute(
        path: "/login",
        name: LoginScreen.id,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: "/main",
        name: MainScreen.id,
        builder: (context, state) => MainScreen())
  ]);

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => AuthCubit())],
        child: MaterialApp.router(
          routerConfig: routes,
        ));
  }
}
