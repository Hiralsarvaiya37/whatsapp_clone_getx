import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_state.dart';

class StatusState {
  final List<StatusItem> list;
  final int currentIndex;
  final bool isPaused;

  StatusState({
    required this.list,
    required this.currentIndex,
    required this.isPaused,
  });

  factory StatusState.initial() =>
      StatusState(list: [], currentIndex: 0, isPaused: false);

  StatusState copyWith({
    List<StatusItem>? list,
    int? currentIndex,
    bool? isPaused,
  }) {
    return StatusState(
      list: list ?? this.list,
      currentIndex: currentIndex ?? this.currentIndex,
      isPaused: isPaused ?? this.isPaused,
    );
  }
}
