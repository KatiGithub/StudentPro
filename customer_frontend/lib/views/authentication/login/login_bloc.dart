import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';
import 'package:studio_projects/views/authentication/login/login_event.dart';
import 'package:studio_projects/views/authentication/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService _authService = AuthService();

  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) => _loginButtonPressed(event, emit));
  }

  void _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {

    emit(LoginLoading());
    try {
      await _authService
          .authenticationWithEmailAndPassword(event.email, event.password)
          .then((bool AuthStatus) {
        if (AuthStatus) {
          emit(LoginSuccess());
        }
      });
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(LoginFailure(error: e.message!));
    } catch (e) {
      print(e);
    }
  }
}
