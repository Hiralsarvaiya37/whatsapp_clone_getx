import 'package:get/state_manager.dart';
import 'package:language_info_plus/language_info_plus.dart';

class SettingController extends GetxController {
  RxBool isOn = false.obs;
  RxBool ison1 = false.obs;
  RxBool ison2 = false.obs;
  RxBool ison3 = false.obs;
  RxBool isYes = false.obs;
  RxString selectedFontSize = "Medium".obs;
  RxString selectedTheme = "System default".obs;
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
