class ChatViewState {
  final bool isOn1;
  final bool isOn2;
  final bool isArchived;
  final bool deleteMedia;
  final int selectedDeleteOption;
  final String selectedGoogleAccount;
  final String backupFrequency;

  ChatViewState({
    required this.isOn1,
    required this.isOn2,
    required this.isArchived,
    required this.deleteMedia,
    required this.selectedDeleteOption,
    required this.selectedGoogleAccount,
    required this.backupFrequency,
  });

  factory ChatViewState.initial() {
    return ChatViewState(
      isOn1: false,
      isOn2: false,
      isArchived: false,
      deleteMedia: false,
      selectedDeleteOption: 0,
      selectedGoogleAccount: "None selected",
      backupFrequency: "Off",
    );
  }

  ChatViewState copyWith({
    bool? isOn1,
    bool? isOn2,
    bool? isArchived,
    bool? deleteMedia,
    int? selectedDeleteOption,
    String? selectedGoogleAccount,
    String? backupFrequency,
  }) {
    return ChatViewState(
      isOn1: isOn1 ?? this.isOn1,
      isOn2: isOn2 ?? this.isOn2,
      isArchived: isArchived ?? this.isArchived,
      deleteMedia: deleteMedia ?? this.deleteMedia,
      selectedDeleteOption:
          selectedDeleteOption ?? this.selectedDeleteOption,
      selectedGoogleAccount:
          selectedGoogleAccount ?? this.selectedGoogleAccount,
      backupFrequency: backupFrequency ?? this.backupFrequency,
    );
  }
}
