class CallState {
  final List<Map<String, String>> frequentlyContacted;
  final List<Map<String, String>> allContacts;
  final List<Map<String, String>> filteredFrequently;
  final List<Map<String, String>> filteredAll;
  final List<String> favorites;

  CallState({
    required this.frequentlyContacted,
    required this.allContacts,
    required this.filteredFrequently,
    required this.filteredAll,
    required this.favorites,
  });

  factory CallState.initial() {
    return CallState(
      frequentlyContacted: [],
      allContacts: [],
      filteredFrequently: [],
      filteredAll: [],
      favorites: [],
    );
  }

  CallState copyWith({
    List<Map<String, String>>? frequentlyContacted,
    List<Map<String, String>>? allContacts,
    List<Map<String, String>>? filteredFrequently,
    List<Map<String, String>>? filteredAll,
    List<String>? favorites,
  }) {
    return CallState(
      frequentlyContacted: frequentlyContacted ?? this.frequentlyContacted,
      allContacts: allContacts ?? this.allContacts,
      filteredFrequently: filteredFrequently ?? this.filteredFrequently,
      filteredAll: filteredAll ?? this.filteredAll,
      favorites: favorites ?? this.favorites,
    );
  }
}
