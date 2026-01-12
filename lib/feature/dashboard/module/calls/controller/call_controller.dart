import 'package:get/state_manager.dart';

class CallController extends GetxController {
  RxString query = "".obs;
  RxList<Map<String, String>> contacts = List.generate(
    30,
    (i) => {
      "name": "User $i",
      "status": "Hey there! I am using WhatsApp.",
      "image":
          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
    },
  ).obs;
  RxList<Map<String, String>> frequentlyContacted = <Map<String, String>>[].obs;
  RxList<Map<String, String>> allContacts = <Map<String, String>>[].obs;
  RxList<Map<String, String>> filteredFrequently = <Map<String, String>>[].obs;
  RxList<Map<String, String>> filteredAll = <Map<String, String>>[].obs;
  RxList<String> frequently = <String>[].obs;
  RxList<String> allFavoritesContacts = <String>[].obs;
  RxList<String> favorites = <String>[].obs;
  RxList<String> filteredFavoritesFrequently = <String>[].obs;
  RxList<String> filteredAllFav = <String>[].obs;

  void changeValue(String value) {
    query.value = value.toLowerCase();

    if (query.value.isEmpty) {
      filteredFrequently.value = frequentlyContacted;
      filteredAll.value = allContacts;
    } else {
      filteredFrequently.value = frequentlyContacted
          .where(
            (c) =>
                c["name"]!.toLowerCase().contains(query.value) ||
                c["status"]!.toLowerCase().contains(query.value),
          )
          .toList();

      filteredAll.value = allContacts
          .where(
            (c) =>
                c["name"]!.toLowerCase().contains(query.value) ||
                c["status"]!.toLowerCase().contains(query.value),
          )
          .toList();
    }
  }
}
