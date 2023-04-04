import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/authentication/register/registration_state.dart';

import '../../../models/university.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit():
      super(RegistrationState());

  void setFirstName(String firstName) {
    emit(state.copyWith(user: state.user.copyWith(firstName: firstName)));
  }

  void setLastName(String lastName) {
    emit(state.copyWith(user: state.user.copyWith(lastName: lastName)));
  }

  void setPersonalEmail(String personalEmail) {
    emit(state.copyWith(user: state.user.copyWith(personalEmail: personalEmail)));
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
}