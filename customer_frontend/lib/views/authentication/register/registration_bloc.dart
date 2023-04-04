// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studio_projects/views/authentication/register/registration_event.dart';
// import 'package:studio_projects/views/authentication/register/registration_state.dart';
//
// import 'package:studio_projects/shared/authentication/auth_service.dart';
//
// import '../../../models/user.dart';
//
// class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
//   final AuthService _authService = AuthService();
//   final User _user = User();
//
//   RegistrationBloc():
//       super(RegistrationInitial()) {
//     emit(RegistrationInitial());
//     on<OnFirstNameChanged>((event, emit) => _onFirstNameChanged(event, emit));
//     on<OnPersonalEmailChanged>((event, emit) => _onPersonalEmailChanged(event, emit));
//     on<OnDateOfBirthChanged>((event, emit) => _onDateOfBirthChanged(event, emit));
//     on<OnLastNameChanged>((event, emit) => _onLastNameChanged(event, emit));
//     on<OnGetInformation>((event, emit) => _onGetInformation(event, emit));
//     on<OnUniversityChanged>((event, emit) => _onUniversityChanged(event, emit));
//     on<OnSchoolEmailChanged>((event, emit) => _onSchoolEmailChanged(event, emit));
//   }
//
//   void _onPersonalEmailChanged(OnPersonalEmailChanged event, Emitter<RegistrationState> emit) {
//     print(event.personalEmail);
//     _user.personalEmail = event.personalEmail;
//   }
//
//   void _onDateOfBirthChanged (OnDateOfBirthChanged event, Emitter<RegistrationState> emit) {
//     print(event.dateOfBirth);
//     _user.dateOfBirth = event.dateOfBirth;
//   }
//
//   void _onFirstNameChanged(OnFirstNameChanged event, Emitter<RegistrationState> emit) {
//     print(event.firstName);
//     _user.firstName = event.firstName;
//   }
//
//   void _onUniversityChanged(OnUniversityChanged event, Emitter<RegistrationState> emit) {
//     print(event.university.name);
//     _user.university = event.university;
//   }
//
//   void _onSchoolEmailChanged(OnSchoolEmailChanged event, Emitter<RegistrationState> emit) {
//     print(event.schoolEmail);
//     _user.userCredentials.schoolEmail = event.schoolEmail;
//   }
//
//   void _onLastNameChanged(OnLastNameChanged event, Emitter<RegistrationState> emit) {
//     print(event.lastName);
//     _user.lastName = event.lastName;
//   }
// }