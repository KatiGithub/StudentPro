import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/views/welcome/welcome_events.dart';
import 'package:studio_projects/views/welcome/welcome_state.dart';
import '../../shared/authentication/auth_service.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  static final AuthService _authService = AuthService();

  WelcomeBloc() : super(WelcomeInitial()) {
    on<OnFinishedPlaying>((event, emit) {
      _mapEventToState(event, emit);
    });
  }

  void _mapEventToState(WelcomeEvent event, Emitter<WelcomeState> emit) async {
    if (kDebugMode) {
      print(event);
    }

    try {
      if(await _authService.isLoggedInSingle()) {
        emit(WelcomeLoginDone());
      } else {
        emit(WelcomeLoginNotDone());
      }
    } catch (e) {
      emit(WelcomeLoginNotDone());
    }

  }
}
