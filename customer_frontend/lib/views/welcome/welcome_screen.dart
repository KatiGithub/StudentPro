import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/shared/utils/location/location_util.dart';
import 'package:studio_projects/views/authentication/login/login_screen.dart';
import 'package:studio_projects/views/main/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).checkLoggedIn();

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return BlocListener<AuthCubit, AuthState>(
          listener: (context, state) async {
            print(state);
            if (state is LoginSucess) {
              await LocationUtil.requestUserPermission().then((_) {
                GoRouter.of(context).pushReplacementNamed(MainScreen.id);
                print("Logged in. Redirecting to Home Page");
              });
            } else {
              GoRouter.of(context).pushReplacementNamed(LoginScreen.id);
              print("Not logged in");
            }
          },
          child: Scaffold(
            body: Container()
          ),
        );
      },
    );
  }
}
