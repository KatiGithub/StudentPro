import 'package:business_frontend/models/user.dart';
import 'package:business_frontend/shared/common_blocs/auth/auth_cubit.dart';
import 'package:business_frontend/views/authentication/registration/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActivationCodeScreen extends StatefulWidget {
  static const id = 'activation_code_screen';

  @override
  State createState() {
    return _ActivationCodeScreenState();
  }
}

class _ActivationCodeScreenState extends State<ActivationCodeScreen> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: CupertinoTextField(
                controller: codeController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CupertinoButton.filled(
                child: const Text("Submit Code"),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context).getBusinessUserFromCode(codeController.text).then((User user) {
                    context.goNamed(RegistrationScreen.id, extra: user);
                  });
                })
          ],
        ),
      ),
    ));
  }
}
