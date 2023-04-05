import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/components/rounded_buttons.dart';
import 'package:studio_projects/views/authentication/register/registration_cubit.dart';

import 'registration_state.dart';

class EmailVerification extends StatefulWidget {
  static final String id = 'email_verification';

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegistrationCubit, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, 'main', (route) => false);
          } else if (state is RegistrationError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          BlocProvider.of<RegistrationCubit>(context).verifySchoolEmail();

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "Click on the link sent to your school email to verify."),
                RoundedButton(
                    title: 'Resend E-mail',
                    colour: Colors.blueAccent,
                    onPressed: () {})
              ],
            ),
          );
        },
      ),
    );
  }
}
