import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/user.dart';
import 'package:studio_projects/shared/common_blocs/auth/auth_state.dart';
import 'package:studio_projects/shared/exception/email_not_verified.dart';
import 'package:studio_projects/shared/exception/registration_unsuccessful.dart';
import 'package:studio_projects/shared/service/user_service.dart';

import '../../authentication/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();
  final UserService _userService = UserService();

  AuthCubit() : super(AuthState(user: User()));

  void submitLoginInformation() async {
    if (!state.user.isFilledOut() || state.password == null) {
      emit(RegistrationError(error: "Information Incomplete", user: state.user));
      return;
    }

    try {
      await _authService.signUp(email: state.user.schoolEmail!, password: state.password!).then((_) async {
        User user = await _userService.register(state.user);
        state.user = user;
        emit(EmailVerificationNeeded(user: state.user));
      });
    } catch (e) {
      if (e is RegistrationUnsuccessful) {
        emit(RegistrationError(error: "An error occurred. Try again later", user: state.user));
      } else {
        emit(RegistrationError(error: e.toString(), user: state.user));
      }
    }

    emit(AuthInitial(user: state.user));
  }

  void checkLoggedIn() async {
    try {
      await _authService.isLoggedInSingle().then((bool isLoggedIn) async {
        if(isLoggedIn) {
          await _userService.login().then((User user) {
            state.user = user;
            emit(LoginSucess(user: state.user));
          });
        } else {
          emit(LoginFailure(error: "Not Yet Logged In", user: state.user));
        }
      });
    } catch (e) {
      emit(LoginFailure(error: e.toString(), user: state.user));
    }
  }

  void login() async {
    if (state.user.schoolEmail == null || state.password == null) {
      emit(LoginFailure(error: "Email or Password not given", user: state.user));
      return;
    }

    try {
      _authService.authenticationWithEmailAndPassword(state.user.schoolEmail!, state.password!).then((_) {
        _userService.register(state.user).then((User user) {
          state.user = user;
          emit(LoginSucess(user: state.user));
        });
      });
    } catch (e) {
      if (e is EmailNotVerified) {
        emit(EmailVerificationNeeded(user: state.user));
      } else {
        emit(LoginFailure(error: e.toString(), user: state.user));
      }
    }

    emit(AuthInitial(user: state.user));
  }

  void verifyEmail() {
    _authService.verifySchoolEmail(state.user.schoolEmail!);
  }

  void checkEmailVerfied() async {
    await _authService.checkEmailVerified(state.user.schoolEmail!).then((_) async {
      if(_) {
        await _userService.emailVerifiedConfirm();
        emit(EmailVerified(user: state.user));
      }
    });
  }
}
