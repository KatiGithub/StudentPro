import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class RegistrationSuccess extends AuthState {}

class AuthError extends AuthState {
  String error;
  AuthError(this.error);
}