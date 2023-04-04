import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/university.dart';

class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class OnGetInformation extends RegistrationEvent {}

class OnPersonalEmailChanged extends RegistrationEvent {
  const OnPersonalEmailChanged({required this.personalEmail});

  final String personalEmail;

  @override
  List<Object> get props => [this.personalEmail];
}

class OnDateOfBirthChanged extends RegistrationEvent {
  const OnDateOfBirthChanged({required this.dateOfBirth});

  final double dateOfBirth;

  @override
  List<Object> get props => [this.dateOfBirth];
}

class OnFirstNameChanged extends RegistrationEvent {
  const OnFirstNameChanged({required this.firstName});

  final String firstName;

  @override
  List<Object> get props => [this.firstName];
}

class OnLastNameChanged extends RegistrationEvent {
  const OnLastNameChanged({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [this.lastName];
}

class OnSchoolEmailChanged extends RegistrationEvent {
  const OnSchoolEmailChanged({required this.schoolEmail});

  final String schoolEmail;

  @override
  List<Object> get props => [this.schoolEmail];
}

class OnUniversityChanged extends RegistrationEvent {
  final University university;

  const OnUniversityChanged({required this.university});

  @override
  List<Object> get props => [this.university];
}
