import 'package:flutter/material.dart';

class AccessibilityViewProvider extends ChangeNotifier {
  bool _isOn1 = false;
  bool _isOn2 = false;
  bool _isOn3 = false;

  bool get isOn1 => _isOn1;

  set isOn1(bool val) {
    _isOn1 = val;
    notifyListeners();
  }

  bool get isOn2 => _isOn2;

  set isOn2(bool val) {
    _isOn2 = val;
    notifyListeners();
  }

  bool get isOn3 => _isOn3;

  set isOn3(bool val) {
    _isOn3 = val;
    notifyListeners();
  }
}
