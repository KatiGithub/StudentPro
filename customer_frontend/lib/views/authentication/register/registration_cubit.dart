import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../models/university.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService _authService = AuthService();

  RegistrationCubit() : super(RegistrationState());

  void setFirstName(String firstName) {
    emit(state.copyWith(user: state.user.copyWith(firstName: firstName)));
  }

  void setLastName(String lastName) {
    emit(state.copyWith(user: state.user.copyWith(lastName: lastName)));
  }

  void setPersonalEmail(String personalEmail) {
    emit(state.copyWith(
        user: state.user.copyWith(personalEmail: personalEmail)));
  }

  void setDateOfBirth(double dateOfBirth) {
    emit(state.copyWith(user: state.user.copyWith(dateOfBirth: dateOfBirth)));
  }

  void setSchoolEmail(String schoolEmail) {
    emit(state.copyWith(user: state.user.copyWith(schoolEmail: schoolEmail)));
  }

  void setPassword(String password) {
    emit(state.copyWith(user: state.user.copyWith(password: password)));
  }

  void setUniversity(University university) {
    emit(state.copyWith(user: state.user.copyWith(university: university)));
  }

  void submitLoginInformation() async {
    if (state.user.firstName == '' ||
        state.user.lastName == '' ||
        state.user.personalEmail == '' ||
        state.user.university == null ||
        state.user.dateOfBirth == 0 ||
        state.user.userCredentials.schoolEmail == '' ||
        state.user.userCredentials.password == '') {
      emit(RegistrationError(error: "Information Incomplete"));
    }

    try {
      _authService.signUp(
          email: state.user.userCredentials.schoolEmail!,
          password: state.user.userCredentials.password!).then((User? user) {
        if(user != null) {

        }
      });
    } on FirebaseAuthException catch (e) {
      print(e.code);
      emit(RegistrationError(error: e.message!));
    } catch (e) {
      emit(RegistrationError(error: e.toString()));
    }
  }

  void verifySchoolEmail() {

  }
}
