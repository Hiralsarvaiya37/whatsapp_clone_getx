abstract class HelpAndFeedbackEvent {}

class ToggleShow extends HelpAndFeedbackEvent {
  final bool value;
  ToggleShow(this.value);
}

class SetHasText extends HelpAndFeedbackEvent {
  final bool value;
  SetHasText(this.value);
}
