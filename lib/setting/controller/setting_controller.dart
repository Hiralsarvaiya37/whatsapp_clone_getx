import 'package:get/state_manager.dart';
import 'package:language_info_plus/language_info_plus.dart';

class SettingController extends GetxController {
   Rx<Language?> selectedLanguage = Rx<Language?>(null);
  RxList<Language> allLanguages = LanguageInfoPlus.languages.obs;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value = LanguageInfoPlus.deviceLanguage;
  }

  void changeLanguage(Language lang){
    selectedLanguage.value = lang;
  }
}
