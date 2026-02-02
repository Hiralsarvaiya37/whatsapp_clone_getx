import 'package:flutter/widgets.dart';

class ChatViewProvider extends ChangeNotifier{
  bool isOn1 = false;
  bool isOn2 = false;
  bool isArchived = false;
  bool deleteMedia = false;
  int selectedDeleteOption = 0;
  String selectedGoogleAccount = "None selected";
  String backupFrequency = "Off";
   void toggleArchive() {
    isArchived = !isArchived;
    notifyListeners();
  }

 void toggleSwitch1(bool val) {
    isOn1 = val;
    notifyListeners();
  }

  void toggleSwitch2(bool val) {
    isOn2 = val;
    notifyListeners();
  }
  void toggleDeleteMedia() {
    deleteMedia = !deleteMedia;
    notifyListeners();
  }

  void setDeleteOption(int val) {
    selectedDeleteOption = val;
    notifyListeners();
  }
}