import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_cubit.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';

class EmailVerification extends StatefulWidget {
  static const String id = 'email_verification';

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      BlocProvider.of<AuthCubit>(context).verifyEmail();
      timer = Timer.periodic(const Duration(seconds: 10), (_) {
        BlocProvider.of<AuthCubit>(context).checkEmailVerfied();
      });
      return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is EmailVerified) {
            Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
          } else if (state is RegistrationError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Click on the link sent to your school email to verify.",
                textAlign: TextAlign.center,
              ),
              RoundedButton(title: 'Resend E-mail', colour: Colors.blueAccent, onPressed: () {})
            ],
          ),
        ),
      );
    }));
  }
}
