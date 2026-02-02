import 'package:flutter/widgets.dart';

class ListViewProvider extends ChangeNotifier {
  bool _isOn = false;
  String selectedOption = "Always";

  bool get isOn => _isOn;

  void setSwitch(bool val) {
    _isOn = val;
    notifyListeners();
  }

  void setOption(String val) {
    selectedOption = val;
    notifyListeners();
  }
}
