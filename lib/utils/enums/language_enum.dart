enum LanguageEnum {
  en,hi,gu
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
    }
  }
}
