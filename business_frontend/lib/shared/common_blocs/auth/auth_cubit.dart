import 'package:business_frontend/shared/authentication/auth_service.dart';
import 'package:business_frontend/shared/common_blocs/auth/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthService authService = AuthService();

  void isLoggedIn() {
    authService.isLoggedIn().first.then((bool isLoggedIn) {
      if(isLoggedIn) {
        emit(LoginSuccess());
      } else {
        emit(AuthError("User not logged in"));
      }

      emit(AuthInitial());
    });
  }

  Stream<bool> getLoggedInSubscription() {
    return authService.isLoggedIn();
  }

  void login(String email, String password) {

  }
}
