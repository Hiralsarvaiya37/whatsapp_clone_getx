class OtpState {
  final bool isLoading;

  OtpState({this.isLoading = false});
  OtpState copyWith({bool? isLoading}) {
    return OtpState(isLoading: isLoading ?? this.isLoading);
  }
}
