import 'package:get/state_manager.dart';

class ContactController extends GetxController{
    RxString query = "".obs;
    List<Map<String, String>> contacts = List.generate(
    30,
    (i) => {
      "name": "User $i",
      "status": "Hey there! I am using WhatsApp.",
      "image":
          "https://i0.wp.com/lahimalaya.com/wp-content/uploads/2019/08/Ladakh-trip.jpg?fit=960%2C640&ssl=1",
    },
  );

    List<Map<String, String>> get frequentlyContacted => contacts.take(5).toList();
    List<Map<String, String>> get allContacts => contacts.skip(5).toList();

  
    List<Map<String, String>> get filteredFrequently => frequentlyContacted
        .where((c) =>
            c["name"]!.toLowerCase().contains(query.toLowerCase()) ||
            c["status"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    List<Map<String, String>> get filteredAll => allContacts
        .where((c) =>
            c["name"]!.toLowerCase().contains(query.toLowerCase()) ||
            c["status"]!.toLowerCase().contains(query.toLowerCase()))
        .toList();

}