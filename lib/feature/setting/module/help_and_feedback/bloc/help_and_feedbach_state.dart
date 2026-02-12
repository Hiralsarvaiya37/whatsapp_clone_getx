class HelpAndFeedbackState {
  final bool isShow;
  final bool hasText;

  HelpAndFeedbackState({
    required this.isShow,
    required this.hasText,
  });

  HelpAndFeedbackState copyWith({
    bool? isShow,
    bool? hasText,
  }) {
    return HelpAndFeedbackState(
      isShow: isShow ?? this.isShow,
      hasText: hasText ?? this.hasText,
    );
  }
}
