enum LanguageEnum {
  en,hi,gu,fr,es,ar
}

extension LanguageEnumExtension on LanguageEnum {
  String get title {
    switch (this) {
      case LanguageEnum.en:
        return "English";
      case LanguageEnum.hi:
        return "Hindi";
      case LanguageEnum.gu:
        return "Gujarati";
      case LanguageEnum.fr:
        return "French";
      case LanguageEnum.es:
        return "Spanish";
      case LanguageEnum.ar:
        return "Arabic";
    }
  }

  String get code {
    switch (this) {
      case LanguageEnum.en:
        return "en";
      case LanguageEnum.hi:
        return "hi";
      case LanguageEnum.gu:
        return "gu";
      case LanguageEnum.fr:
        return "fr";
      case LanguageEnum.es:
        return "es";
      case LanguageEnum.ar:
        return "ar";
    }
  }
}
