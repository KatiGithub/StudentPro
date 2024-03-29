import 'package:equatable/equatable.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class OnStart extends WelcomeEvent {}

class OnFinishedPlaying extends WelcomeEvent {}