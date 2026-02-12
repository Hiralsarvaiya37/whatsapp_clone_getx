abstract class ChatViewEvent {}

class ToggleOn1 extends ChatViewEvent {}

class ToggleOn2 extends ChatViewEvent {}

class ToggleArchived extends ChatViewEvent {}

class ToggleDeleteMedia extends ChatViewEvent {}

class ChangeDeleteOption extends ChatViewEvent {
  final int option;
  ChangeDeleteOption(this.option);
}

class ChangeGoogleAccount extends ChatViewEvent {
  final String account;
  ChangeGoogleAccount(this.account);
}

class ChangeBackupFrequency extends ChatViewEvent {
  final String frequency;
  ChangeBackupFrequency(this.frequency);
}
