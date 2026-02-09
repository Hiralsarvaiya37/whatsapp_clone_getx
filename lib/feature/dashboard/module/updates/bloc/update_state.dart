import 'dart:io';

enum StatusType { image, video }

class StatusItem {
  final File file;
  final StatusType type;

  StatusItem({required this.file, required this.type});
}

class UpdateState {
  final List<StatusItem> statusList;
  final bool isArrowDown;
  final bool isDown;

  UpdateState({
    required this.statusList,
    this.isArrowDown = true,
    this.isDown = true,
  });

  factory UpdateState.initial() => UpdateState(statusList: []);

  UpdateState copyWith({
    List<StatusItem>? statusList,
    bool? isArrowDown,
    bool? isDown,
  }) {
    return UpdateState(
      statusList: statusList ?? this.statusList,
      isArrowDown: isArrowDown ?? this.isArrowDown,
      isDown: isDown ?? this.isDown,
    );
  }
}
