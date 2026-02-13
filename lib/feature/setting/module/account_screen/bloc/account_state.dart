// account_state.dart
import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';

class AccountState {
  final bool isNotificationOn;
  final bool? feedback;
  final bool isPlaying;
  final bool isVideoInitialized;
  final int selectedOption;
  final AccountOptionsEnum? navigateTo;
  final bool isAccountInfoOn;
  final bool isChannelsActivityOn;
  final Country? selectedCountry;
  final bool isDeleting;

  AccountState({
    required this.isNotificationOn,
    required this.isPlaying,
    required this.isVideoInitialized,
    required this.feedback,
    required this.selectedOption,
    this.navigateTo,
    required this.isAccountInfoOn,
    required this.isChannelsActivityOn,
    this.selectedCountry,
    required this.isDeleting,
  });

  factory AccountState.initial() => AccountState(
        isNotificationOn: false,
        isPlaying: false,
        isVideoInitialized: false,
        selectedOption: -1,
        navigateTo: null,
        isAccountInfoOn: false,
        isChannelsActivityOn: false,
        selectedCountry: null,
        isDeleting: false,
        feedback: null,
      );

  AccountState copyWith({
    bool? isNotificationOn,
    bool? isPlaying,
    bool? feedback,
    bool? isVideoInitialized,
    int? selectedOption,
    AccountOptionsEnum? navigateTo,
    bool? isAccountInfoOn,
    bool? isChannelsActivityOn,
    Country? selectedCountry,
    bool? isDeleting,
  }) {
    return AccountState(
      isNotificationOn: isNotificationOn ?? this.isNotificationOn,
      isPlaying: isPlaying ?? this.isPlaying,
      feedback: feedback ?? this.feedback,
      isVideoInitialized: isVideoInitialized ?? this.isVideoInitialized,
      selectedOption: selectedOption ?? this.selectedOption,
      navigateTo: navigateTo ?? this.navigateTo,
      isAccountInfoOn: isAccountInfoOn ?? this.isAccountInfoOn,
      isChannelsActivityOn: isChannelsActivityOn ?? this.isChannelsActivityOn,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}