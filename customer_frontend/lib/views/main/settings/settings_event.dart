import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnLanguageChanged extends SettingsEvent {
  String languageId;

  OnLanguageChanged({required this.languageId});
}