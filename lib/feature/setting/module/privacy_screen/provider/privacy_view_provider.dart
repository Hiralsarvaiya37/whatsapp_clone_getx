import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';

class PrivacyViewProvider extends ChangeNotifier {
  final SettingProvider settingController;

  PrivacyViewProvider({required this.settingController});

  String selectedLastSeen = "Nobody";
  String selectedOnline = "Everyone";

  void updateMessageTimer(String value) {
    selectedOption = value;
    notifyListeners();
  }

   String selectedOption = "My contacts";

  void updateAvatarOption(String value) {
    selectedOption = value;
    notifyListeners();
  }

  bool isNo = false;

  bool _isYes = false;

  bool get isYes => _isYes;
   void updateLastSeen(String newValue) {
    selectedLastSeen = newValue;
    notifyListeners(); 
  }
 void updateOnline(String newValue) {
    selectedOnline = newValue;
    notifyListeners();
  }
  set isYes(bool val) {
    _isYes = val;
    notifyListeners();
  }

  bool _isOn = false;

  bool get isOn => _isOn;

  set isOn(bool val) {
    _isOn = val;
    notifyListeners();
  }
  bool _isOn1 = false;

  bool get isOn1 => _isOn1;

  set isOn1(bool val) {
    _isOn1 = val;
    notifyListeners();
  }
  bool _isOn2 = false;

  bool get isOn2 => _isOn2;

  set isOn2(bool val) {
    _isOn2 = val;
    notifyListeners();
  }
  bool _isOn3 = false;

  bool get isOn3 => _isOn3;

  set isOn3(bool val) {
    _isOn3 = val;
    notifyListeners();
  }

  void setLastSeen(String value) {
    selectedLastSeen = value;
    notifyListeners();
  }

  void setSelectedOption(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void setSelectedOption1(String value) {
    selectedOption = value;
    notifyListeners();
  }

  void setOnlineStatus(String value) {
    selectedOnline = value;
    notifyListeners();
  }

  void toggleIsOn() {
    isOn = !isOn;
    notifyListeners();
  }

  void toggleIsOn1() {
    isOn1 = !isOn1;
    notifyListeners();
  }

  void toggleIsOn2() {
    isOn2 = !isOn2;
    notifyListeners();
  }

  void toggleIsOn3() {
    isOn3 = !isOn3;
    notifyListeners();
  }

  void setYes(bool value) {
    isYes = value;
    notifyListeners();
  }
   void setOn(bool value) {
    isOn = value;
    notifyListeners();
  }

  void setNo(bool value) {
    isNo = value;
    notifyListeners();
  }
}
