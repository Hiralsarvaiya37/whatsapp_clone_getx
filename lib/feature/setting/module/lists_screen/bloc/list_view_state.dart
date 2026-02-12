class ListViewState {
  final bool isOn;
  final String selectedOption;

  ListViewState({this.isOn = false, this.selectedOption = "Always"});

  ListViewState copyWith({bool? isOn, String? selectedOption}) {
    return ListViewState(
      isOn: isOn ?? this.isOn,
      selectedOption: selectedOption ?? this.selectedOption,
    );
  }
}
