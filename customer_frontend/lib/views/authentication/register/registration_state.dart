import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/user.dart';

class RegistrationState extends Equatable {
  final User? user;
  String? password;
  bool schoolEmailVerified = false;

  RegistrationState( {User? user, this.password}) :
        this.user = user;

  RegistrationState copyWith({User? user}) {
    return RegistrationState(
      user: user ?? this.user
    );
  }

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationEmailVerification extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationError extends RegistrationState{
  final String error;

  RegistrationError({required this.error});

  String toString() => 'Registration { error: $error }';

}