import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  

  void changeIndex(int page) {
    currentIndex.value = page;
  }

  String getAppBarName(int index){

    return index==0?"Whatsapp":index== 1 ?"Updates":index==2 ?"Communities": index==3 ? "Calls": "";
  }
}
