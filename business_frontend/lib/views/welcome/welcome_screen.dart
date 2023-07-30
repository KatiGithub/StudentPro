import 'package:business_frontend/shared/common_blocs/auth/auth_cubit.dart';
import 'package:business_frontend/shared/common_blocs/auth/auth_state.dart';
import 'package:business_frontend/views/authentication/login/login_screen.dart';
import 'package:business_frontend/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {

  static const id = 'welcome';

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AuthCubit>(context).isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {

      return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
        if(state is LoginSuccess) {
          print("Pushing to main");
          GoRouter.of(context).pushReplacementNamed(MainScreen.id);
        } else if(state is AuthError) {
          print("Pushing to login");
          context.pushReplacementNamed(LoginScreen.id);
        }
      }, child: Scaffold(body: Container(),));
    });
  }
}