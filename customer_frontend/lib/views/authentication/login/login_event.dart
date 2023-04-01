import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({
    required this.email,
    required this.password
  });

  @override
  List<Object> get props => [this.email, this.password];

  @override
  String toString() => 'LoginButtonPressed { username: $email, password: $password }';
}