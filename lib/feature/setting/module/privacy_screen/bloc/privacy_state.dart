class PrivacyState {
  final String selectedLastSeen;
  final String selectedOnline;
  final String selectedOption;

  final bool isOn;
  final bool isOn1;
  final bool isOn2;
  final bool isOn3;
  final bool isYes;
  final bool isNo;

  PrivacyState({
    this.selectedLastSeen = "Nobody",
    this.selectedOnline = "Everyone",
    this.selectedOption = "",
    this.isOn = false,
    this.isOn1 = false,
    this.isOn2 = false,
    this.isOn3 = false,
    this.isYes = false,
    this.isNo = false,
  });

  PrivacyState copyWith({
    String? selectedLastSeen,
    String? selectedOnline,
    String? selectedOption,
    bool? isOn,
    bool? isOn1,
    bool? isOn2,
    bool? isOn3,
    bool? isYes,
    bool? isNo,
  }) {
    return PrivacyState(
      selectedLastSeen: selectedLastSeen ?? this.selectedLastSeen,
      selectedOnline: selectedOnline ?? this.selectedOnline,
      selectedOption: selectedOption ?? this.selectedOption,
      isOn: isOn ?? this.isOn,
      isOn1: isOn1 ?? this.isOn1,
      isOn2: isOn2 ?? this.isOn2,
      isOn3: isOn3 ?? this.isOn3,
      isYes: isYes ?? this.isYes,
      isNo: isNo ?? this.isNo,
    );
  }
}
