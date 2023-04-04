import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/user.dart';

class RegistrationState extends Equatable {
  final User user;

  RegistrationState({User? user}) : this.user = user ?? User();

  RegistrationState copyWith({User? user}) {
    return RegistrationState(
      user: user ?? this.user
    );
  }

  @override
  List<Object> get props => [this.user];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationError extends RegistrationState{
  final String error;

  RegistrationError({required this.error});

  String toString() => 'Registration { error: $error }';

}