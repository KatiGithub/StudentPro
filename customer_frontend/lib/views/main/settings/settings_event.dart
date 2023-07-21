import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnLanguageChanged extends SettingsEvent {
  String languageId;

  OnLanguageChanged({required this.languageId});
}

class OnThemeModeChanged extends SettingsEvent {
  bool darkMode;

  OnThemeModeChanged({required this.darkMode});
}

class OnLogOut extends SettingsEvent {
  BuildContext context;

  OnLogOut(this.context);
}