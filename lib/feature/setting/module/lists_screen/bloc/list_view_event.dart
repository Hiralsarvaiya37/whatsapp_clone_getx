abstract class ListViewEvent {}
class ToggleIsOn extends ListViewEvent {
  final bool value;
  ToggleIsOn(this.value);
}
class ToggleOption extends ListViewEvent {
  final String value;
  ToggleOption(this.value);
}