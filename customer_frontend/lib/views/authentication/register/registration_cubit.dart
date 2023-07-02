import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../models/university.dart';
import 'package:studio_projects/shared/authentication/auth_service.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final AuthService _authService = AuthService();

  RegistrationCubit() : super(RegistrationState());

  void setFirstName(String firstName) {
    state.user?.firstName = firstName;
  }

  void setLastName(String lastName) {
    state.user?.lastName = lastName;
  }

  void setPersonalEmail(String personalEmail) {
   state.user?.personalEmail = personalEmail;
  }

  void setDateOfBirth(double dateOfBirth) {
    state.user?.dateOfBirth = dateOfBirth;
  }

  void setSchoolEmail(String schoolEmail) {
    state.user?.schoolEmail = schoolEmail;
  }

  void setPassword(String password) {
    state.password = password;
  }

  void setUniversity(University university) {
    state.user?.university = university;
  }

  void submitLoginInformation() async {
    if (state.user?.firstName == '' ||
        state.user?.lastName == '' ||
        state.user?.personalEmail == '' ||
        state.user?.dateOfBirth == 0 ||
        state.user?.schoolEmail == '') {
      emit(RegistrationError(error: "Information Incomplete"));
      return;
    }

    _authService
        .signUp(email: state.user!.schoolEmail!, password: state.password!)
        .then((User? user) {
      if (user != null) {
        emit(RegistrationEmailVerification());
      }
    }).onError((FirebaseAuthException error, stackTrace) {
      emit(RegistrationError(error: error.message!));
    });
  }

  void verifySchoolEmail() {
    _authService.verifySchoolEmail(state.user!.schoolEmail!);
  }

  void checkSchoolEmail() async {
    await _authService.checkEmailVerified(state.user!.schoolEmail!).then((bool isVerified) {
      if (isVerified) {
        emit(RegistrationSuccess());
        state.schoolEmailVerified = true;
      }
    });
  }
}
