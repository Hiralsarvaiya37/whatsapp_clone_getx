import 'package:flutter/widgets.dart';

class DashboardProvider extends ChangeNotifier {
  int currentIndex = 0;
  
final pageController = PageController();
  void changeIndex(int page) {
    currentIndex = page;
    notifyListeners();
  }

  String getAppBarName(int index){

    return index==0?"Whatsapp":index== 1 ?"Updates":index==2 ?"Communities": index==3 ? "Calls": "";
  }
}
