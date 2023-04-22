import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/settings.dart';

@JsonSerializable()
class SettingsState extends Equatable {
  Settings settings;

  SettingsState({required this.settings});

  @override
  List<Object?> get props => [settings];

  factory SettingsState.fromJson(Map<String, dynamic> json) =>
      _SettingsStateFromJson(json);

  Map<String, dynamic> toJson() => _SettingsToJson(this);
}

class SettingsInitial extends SettingsState {
  SettingsInitial({required super.settings});
}

class LanguageSettingsChanged extends SettingsState {
  LanguageSettingsChanged({required super.settings});
}

class ThemeModeSettingsChanged extends SettingsState {
  ThemeModeSettingsChanged({required super.settings});
}

SettingsState _SettingsStateFromJson(Map<String, dynamic> json) {
  return SettingsState(settings: Settings.fromJson(json['current_settings']));
}

Map<String, dynamic> _SettingsToJson(SettingsState instance) {
  return {'current_settings': instance.settings.toJson()};
}
