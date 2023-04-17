import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Settings {
  bool? darkMode;
  String? languageId ;

  Settings({
    this.darkMode = false,
    this.languageId = 'en'
  });

  factory Settings.fromJson(Map<String, dynamic> json) => _SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}

Settings _SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
      darkMode: json['darkMode'],
      languageId: json['languageId']
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) {
  return {
    'darkMode': instance.darkMode,
    'languageId': instance.languageId
  };
}