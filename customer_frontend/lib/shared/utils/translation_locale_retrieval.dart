import 'package:flutter/cupertino.dart';
import 'package:studio_projects/models/translation.dart';

class TranslationLocalePicker {
  static String translationPicker(List<Translation> translations, BuildContext context) {
    final currentLocale = Localizations.localeOf(context).languageCode.toLowerCase();
    String englishTranslation = "";

    for (Translation translation in translations) {
      if(translation.language == "en") {
        englishTranslation = translation.translation;
      }
      if(translation.language == currentLocale) {
        return translation.translation;
      }
    }

    return englishTranslation;
  }
}