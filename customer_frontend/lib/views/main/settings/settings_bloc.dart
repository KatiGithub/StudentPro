import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studio_projects/views/main/settings/settings_event.dart';
import 'package:studio_projects/views/main/settings/settings_state.dart';
import 'package:studio_projects/models/settings.dart';

import '../../../shared/authentication/auth_service.dart';

class SettingsBloc extends HydratedBloc<SettingsEvent, SettingsState> {
  final AuthService _authService = AuthService();

  SettingsBloc(): super(SettingsInitial(settings: Settings())) {
    on<OnLanguageChanged>((event, emit) => _languageChanged(event, emit));
    on<OnThemeModeChanged>((event, emit) => _themeModeChanged(event, emit));
    on<OnLogOut>((event, emit) => _onSignOut(event, emit));
  }

  void _onSignOut(SettingsEvent event, Emitter<SettingsState> emit) {
    _authService.logOut();
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