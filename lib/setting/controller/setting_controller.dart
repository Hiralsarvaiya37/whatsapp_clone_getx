import 'package:get/state_manager.dart';
import 'package:language_info_plus/language_info_plus.dart';

class SettingController extends GetxController {
  RxBool isOn = false.obs;
  RxBool ison1 = false.obs;
  RxBool ison2 = false.obs;
  RxBool ison3 = false.obs;
  RxBool isYes = false.obs;
  RxBool  isShow = false.obs;
  RxBool  showIcon = false.obs;
  RxString  selectedoption = "Default".obs;
  RxString selectedFontSize = "Medium".obs;
  RxString selectedTheme = "System default".obs;
  RxString selectedoption1 = "White".obs;
   Rx<Language?> selectedLanguage = Rx<Language?>(null);
  RxList<Language> allLanguages = LanguageInfoPlus.languages.obs;
   RxList<bool> isOn4 = List.generate(9, (_) => false).obs;
     RxMap<String, bool> selectedItems = {
    "Photos": false,
    "Audio": false,
    "Videos": false,
    "Documents": false,
  }.obs;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value = LanguageInfoPlus.deviceLanguage;
  }

  void changeLanguage(Language lang){
    selectedLanguage.value = lang;
  }
}
