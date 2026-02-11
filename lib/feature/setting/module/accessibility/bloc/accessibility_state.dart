class AccessibilityState {
  final bool isOn1;
  final bool isOn2;
  final bool isOn3;

  AccessibilityState({
    required this.isOn1,
    required this.isOn2,
    required this.isOn3,
  });

  factory AccessibilityState.initial() {
    return AccessibilityState(isOn1: true, isOn2: true, isOn3: true);
  }

  AccessibilityState copyWith({bool? isOn1, bool? isOn2, bool? isOn3}) {
    return AccessibilityState(
      isOn1: isOn1 ?? this.isOn1,
      isOn2: isOn2 ?? this.isOn2,
      isOn3: isOn3 ?? this.isOn3,
    );
  }
}
