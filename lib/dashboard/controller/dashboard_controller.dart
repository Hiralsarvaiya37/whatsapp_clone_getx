import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  

  void changeIndex(int page) {
    currentIndex.value = page;
  }
}
