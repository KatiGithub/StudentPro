import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/shared/utils/location/location_util.dart';

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
                Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
                print("Logged in. Redirecting to Home Page");
              });
            } else {
              Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
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
