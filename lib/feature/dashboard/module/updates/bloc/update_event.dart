import 'dart:io';

abstract class UpdateEvent {}

class AddImageEvent extends UpdateEvent {
  final File file;
  AddImageEvent(this.file);
}

class AddVideoEvent extends UpdateEvent {
  final File file;
  AddVideoEvent(this.file);
}

class ToggleArrowEvent extends UpdateEvent {}

class ToggleDownEvent extends UpdateEvent {}
