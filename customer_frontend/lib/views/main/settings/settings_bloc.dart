import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studio_projects/main.dart';
import 'package:studio_projects/views/authentication/login/login_screen.dart';
import 'package:studio_projects/views/main/settings/settings_event.dart';
import 'package:studio_projects/views/main/settings/settings_state.dart';
import 'package:studio_projects/models/settings.dart';
import 'package:studio_projects/views/welcome/welcome_screen.dart';

import '../../../shared/authentication/auth_service.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final AuthService _authService = AuthService();

  SettingsBloc(): super(SettingsInitial(settings: Settings())) {
    on<OnLanguageChanged>((event, emit) => _languageChanged(event, emit));
    on<OnThemeModeChanged>((event, emit) => _themeModeChanged(event, emit));
    on<OnLogOut>((event, emit) => _onSignOut(event, emit));
  }

  void _onSignOut(OnLogOut event, Emitter<SettingsState> emit) {
     return _authService.logOut();
  }

  void _languageChanged(OnLanguageChanged event, Emitter<SettingsState> emit) {
    state.settings.languageId = event.languageId;
    emit(LanguageSettingsChanged(settings: state.settings));
    emit(SettingsInitial(settings: state.settings));
  }

  void _themeModeChanged(OnThemeModeChanged event, Emitter<SettingsState> emit) {
    state.settings.darkMode = event.darkMode;
    emit(ThemeModeSettingsChanged(settings: state.settings));
    emit(SettingsInitial(settings: state.settings));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}