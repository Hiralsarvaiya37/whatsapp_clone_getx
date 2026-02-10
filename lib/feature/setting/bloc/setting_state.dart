import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';

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
  final String selectedTheme;
  final bool isEnterSend; // corresponds to ison1
  final bool isMediaVisibility; // corresponds to ison2
  final bool keepChatsArchived;
   final double selectedFontSize;

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
      isShow1: false, // initial value
      isShow2: false,
      isShow3: false,
      isEnterSend: false,
      isMediaVisibility: false,
      keepChatsArchived: false,
      selectedTheme: "",
      selectedFontSize: 16.0,
    );
  }

  SettingState copyWith({
    LanguageEnum? language,
    String? profilePicUrl,
    bool? isLoading,
    bool? isOn,
    String? selectedOption,
    Map<String, bool>? selectedItems,
    bool? isShow1, // add
    bool? isShow2,
    bool? isShow3,
    String? selectedTheme,
    bool? isEnterSend,
    bool? isMediaVisibility,
    bool? keepChatsArchived,
    double? selectedFontSize,
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
    );
  }
}
