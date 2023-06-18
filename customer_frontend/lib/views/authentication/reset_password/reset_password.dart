import 'package:flutter/material.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';

class ResetPasswordScreen extends StatelessWidget {
  static final id = 'reset_password';

  TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "Enter your email...",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0))),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              height: 60,
              onPressed: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                currentFocus.unfocus();

                _authService.sendPasswordResetEmail(_emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.greenAccent,
                    content: Text("Email Link Sent!")));

                Future.delayed(Duration(seconds: 3))
                    .then((value) => Navigator.pop(context));
              },
              child: Text("Send Reset Link"),
              color: Color.fromRGBO(237, 188, 161, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: Color.fromRGBO(230, 140, 92, 1.0),
                      width: 2.5,
                      strokeAlign: BorderSide.strokeAlignInside,
                      style: BorderStyle.solid)),
            )
          ],
        ),
      ),
    );
  }
}
