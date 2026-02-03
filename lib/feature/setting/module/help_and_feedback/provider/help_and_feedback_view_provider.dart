import 'package:flutter/widgets.dart';

class HelpAndFeedbackViewProvider extends ChangeNotifier {
  bool _hasText = false;
  bool _isShow = false;
  bool get isShow => _isShow;

  set isShow(bool val) {
    _isShow = val;
    notifyListeners();
  }

  bool get hasText => _hasText;

  set hasText(bool val) {
    _hasText = val;
    notifyListeners();
  }
}
