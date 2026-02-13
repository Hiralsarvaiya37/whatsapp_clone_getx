import 'package:country_picker/country_picker.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';

abstract class AccountEvent {}

class InitVideoEvent extends AccountEvent {}

class PlayPauseEvent extends AccountEvent {}  

class SelectOptionEvent extends AccountEvent {
  final int index;
  SelectOptionEvent(this.index);
}
class ToggleAccountInformationEvent extends AccountEvent {}

class ToggleChannelsActivityEvent extends AccountEvent {}

class ResetNavigationEvent extends AccountEvent {}

class ToggleNotificationEvent extends AccountEvent {}
class ToggleCountryEvent extends AccountEvent {
  final Country country;
  ToggleCountryEvent(this.country);
}
class UpdatePhoneNumberEvent extends AccountEvent {
  final String phone;
  UpdatePhoneNumberEvent(this.phone);
}

class DeleteAccountEvent extends AccountEvent {
  final String phoneNumber;
  final String countryCode;
  DeleteAccountEvent({required this.phoneNumber, required this.countryCode});
}

class NavigateAccountOptionEvent extends AccountEvent {
  final AccountOptionsEnum option;
  NavigateAccountOptionEvent(this.option);
}
class SubmitFeedbackEvent extends AccountEvent {
  final bool isYes;
  SubmitFeedbackEvent(this.isYes);
}

