import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/user.dart';

class AuthState extends Equatable {
  User user;
  String? password;

  AuthState({required this.user, this.password});

  @override
  List<Object?> get props {
    throw UnimplementedError();
  }
}

class AuthInitial extends AuthState {
  AuthInitial({required super.user});
}

class EmailVerificationNeeded extends AuthState {
  EmailVerificationNeeded({required super.user});
}

class RegistrationSuccess extends AuthState {
  RegistrationSuccess({required super.user});
}

class RegistrationError extends AuthState {
  final String error;

  RegistrationError({required this.error, required super.user});

  String toString() => 'Registration { error: $error }';
}

class EmailVerified extends AuthState {
  EmailVerified({required super.user});
}

class LoginSucess extends AuthState {
  LoginSucess({required super.user});
}

class LoginFailure extends AuthState {
  final String error;

  LoginFailure({required this.error, required super.user});

  @override
  String toString() => 'LoginFailure { error: $error }';
}