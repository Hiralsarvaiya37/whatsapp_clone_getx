import 'package:flutter/material.dart';

class CallProvider extends ChangeNotifier {
  // Search query
  String query = "";

  // Sab contacts
  List<Map<String, String>> contacts = List.generate(
    30,
    (i) => {
      "name": "User $i",
      "status": "Hey there! I am using WhatsApp.",
      "image":
          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
    },
  );

  // Frequently contacted contacts
  List<Map<String, String>> frequentlyContacted = [];
  // All contacts (baki)
  List<Map<String, String>> allContacts = [];

  // Filtered lists for search
  List<Map<String, String>> filteredFrequently = [];
  List<Map<String, String>> filteredAll = [];

  // Favorites
  List<String> frequently = [];
  List<String> allFavoritesContacts = [];
  List<String> favorites = [];

  List<String> filteredFavoritesFrequently = [];
  List<String> filteredAllFav = [];

  // Search controller
  final TextEditingController searchController = TextEditingController();

  CallProvider() {
    // Provider ke constructor me initialisation
    initData();
  }

  // Initial data setup
  void initData() {
    frequentlyContacted = contacts.take(5).toList(); // Top 5
    allContacts = contacts.skip(5).toList();        // Baaki contacts

    filteredFrequently = List.from(frequentlyContacted);
    filteredAll = List.from(allContacts);

    frequently = List.generate(5, (i) => "User ${i + 1}");
    allFavoritesContacts = List.generate(15, (i) => "User ${i + 6}");
    filteredFavoritesFrequently = List.from(frequently);
    filteredAllFav = List.from(allFavoritesContacts);
  }

  // Search for contacts (map type)
  void changeValue(String value) {
    query = value.toLowerCase();

    if (query.isEmpty) {
      filteredFrequently = List.from(frequentlyContacted);
      filteredAll = List.from(allContacts);
    } else {
      filteredFrequently = frequentlyContacted
          .where((c) =>
              c["name"]!.toLowerCase().contains(query) ||
              c["status"]!.toLowerCase().contains(query))
          .toList();

      filteredAll = allContacts
          .where((c) =>
              c["name"]!.toLowerCase().contains(query) ||
              c["status"]!.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners(); // Provider me ye zaruri hai UI update ke liye
  }

  // Search for favorite contacts (string type)
  void searchContacts(String query) {
    if (query.isEmpty) {
      filteredFavoritesFrequently = List.from(frequently);
      filteredAllFav = List.from(allFavoritesContacts);
    } else {
      filteredFavoritesFrequently = frequently
          .where((c) => c.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filteredAllFav = allFavoritesContacts
          .where((c) => c.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  // Add user to favorites
  void addToFavorites(String user) {
    if (!favorites.contains(user)) {
      favorites.add(user);
      notifyListeners();
    }
  }
}
