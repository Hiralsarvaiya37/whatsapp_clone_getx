import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';

class PrivacyViewProvider extends ChangeNotifier {
  final SettingProvider settingController;

  PrivacyViewProvider({required this.settingController});

  String selectedLastSeen = "Nobody";
  String selectedOnline = "Everyone";
  String selectedOption = "";

  bool isOn1 = false;
  bool isOn2 = false;
  bool isOn3 = false;
  bool isNo = false;

  bool _isYes = false;

  bool get isYes => _isYes;

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

  void setNo(bool value) {
    isNo = value;
    notifyListeners();
  }
}
