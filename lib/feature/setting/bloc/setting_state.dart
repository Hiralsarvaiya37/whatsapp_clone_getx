import 'package:whatsapp_clone_getx/utils/enums/app_theme_mode.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';

class MediaKey {
  static const photos = "photos";
  static const audio = "audio";
  static const video = "video";
  static const documents = "documents";
}

class SettingState {
  final LanguageEnum language;
  final String profilePicUrl;
  final bool isLoading;
  final bool isOn;
  final String selectedOption;
  final Map<String, bool> selectedItems;
  final bool isShow1;
  final bool isShow2;
  final bool isShow3;
  final AppThemeMode selectedTheme;
  final bool isEnterSend;
  final bool isMediaVisibility;
  final bool keepChatsArchived;
  final double selectedFontSize;
  final String selectedToneOption;
  final String selectedVibrateOption;
  final String selectedLightOption;

  SettingState({
    required this.language,
    required this.profilePicUrl,
    required this.isLoading,
    required this.isOn,
    required this.selectedItems,
    required this.selectedOption,
    required this.isShow1,
    required this.isShow2,
    required this.isShow3,
    required this.isEnterSend,
    required this.isMediaVisibility,
    required this.keepChatsArchived,
    required this.selectedTheme,
    required this.selectedFontSize,
    required this.selectedToneOption,
    required this.selectedVibrateOption,
    required this.selectedLightOption,
  });

  factory SettingState.initial() {
    return SettingState(
      language: LanguageEnum.en,
      profilePicUrl: "",
      isLoading: false,
      isOn: false,
      selectedOption: "",
      selectedItems: {
        "Photos": false,
        "Audio": false,
        "Video": false,
        "Documents": false,
      },
      isShow1: false,
      isShow2: false,
      isShow3: false,
      isEnterSend: false,
      isMediaVisibility: false,
      keepChatsArchived: false,
      selectedTheme: AppThemeMode.system,
      selectedFontSize: 16.0,
      selectedToneOption: "Default",
      selectedVibrateOption: "Off",
      selectedLightOption: "None",
    );
  }

  SettingState copyWith({
    LanguageEnum? language,
    String? profilePicUrl,
    bool? isLoading,
    bool? isOn,
    String? selectedOption,
    Map<String, bool>? selectedItems,
    bool? isShow1,
    bool? isShow2,
    bool? isShow3,
    AppThemeMode? selectedTheme,
    bool? isEnterSend,
    bool? isMediaVisibility,
    bool? keepChatsArchived,
    double? selectedFontSize,
    String? selectedToneOption,
    String? selectedVibrateOption,
    String? selectedLightOption,
  }) {
    return SettingState(
      language: language ?? this.language,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      isLoading: isLoading ?? this.isLoading,
      isOn: isOn ?? this.isOn,
      selectedItems: selectedItems ?? this.selectedItems,
      selectedOption: "",
      isShow1: isShow1 ?? this.isShow1,
      isShow2: isShow2 ?? this.isShow2,
      isShow3: isShow3 ?? this.isShow3,
      selectedTheme: selectedTheme ?? this.selectedTheme,
      isEnterSend: isEnterSend ?? this.isEnterSend,
      isMediaVisibility: isMediaVisibility ?? this.isMediaVisibility,
      keepChatsArchived: keepChatsArchived ?? this.keepChatsArchived,
      selectedFontSize: selectedFontSize ?? this.selectedFontSize,
      selectedToneOption: selectedToneOption ?? this.selectedToneOption,
      selectedVibrateOption:
          selectedVibrateOption ?? this.selectedVibrateOption,
      selectedLightOption: selectedLightOption ?? this.selectedLightOption,
    );
  }
}
