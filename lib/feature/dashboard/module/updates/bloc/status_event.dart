import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_state.dart';

abstract class StatusEvent {}

class InitStatus extends StatusEvent {
  final List<StatusItem> list;
  InitStatus(this.list);
}

class ChangeStatus extends StatusEvent {
  final int index;
  ChangeStatus(this.index);
}

class PauseStatus extends StatusEvent {}
class ResumeStatus extends StatusEvent {}
class NextStatus extends StatusEvent {}
class PreviousStatus extends StatusEvent {}
