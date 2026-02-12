abstract class PrivacyEvent {}

class SetLastSeen extends PrivacyEvent {
  final String value;
  SetLastSeen(this.value);
}

class SetOnlineStatus extends PrivacyEvent {
  final String value;
  SetOnlineStatus(this.value);
}

class ToggleIsOn extends PrivacyEvent {
  final bool value;
  ToggleIsOn(this.value);
}

class ToggleIsOn1 extends PrivacyEvent {
  final bool value;
  ToggleIsOn1(this.value);
}
class ToggleIsOn2 extends PrivacyEvent {
  final bool value;
  ToggleIsOn2(this.value);
}
class ToggleOption extends PrivacyEvent {
  final String value;
  ToggleOption(this.value);
}

