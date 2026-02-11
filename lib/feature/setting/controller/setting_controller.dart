import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';

class SettingController extends GetxController {
  RxBool isOn = false.obs;
  RxBool ison1 = false.obs;
  RxBool ison2 = false.obs;
  RxBool ison3 = false.obs;
  RxBool isYes = false.obs;
  RxBool isShow = false.obs;
  RxBool isShow1 = true.obs;
  RxBool isShow2 = false.obs;
  RxBool isShow3 = true.obs;
  RxBool showIcon = false.obs;
  RxString selectedoption = "Default".obs;
  RxString selectedFontSize = "Medium".obs;
  RxString selectedTheme = "System default".obs;
  RxString selectedoption1 = "White".obs;
  Rx<LanguageEnum> selectedLanguage = LanguageEnum.en.obs;
  RxList<bool> isOn4 = List.generate(9, (_) => false).obs;
  RxMap<String, bool> selectedItems = {
    "Photos": false,
    "Audio": false,
    "Videos": false,
    "Documents": false,
  }.obs;
  Rx<Locale> appLocale = const Locale('en').obs;  

void changeLanguage(LanguageEnum lang) {
  selectedLanguage.value = lang;
  final newLocale = Locale(lang.code); 
  
  appLocale.value = newLocale;        
  Get.updateLocale(newLocale);        
}

  @override
  void onInit() {
    super.onInit();
    loadCurrentProfilePic();
  }

  void loadCurrentProfilePic() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    if (doc.exists && doc.data()!.containsKey('profilePicUrl')) {
      profilePicUrl.value = doc['profilePicUrl'];
    }
  }

   

  RxList<StatusItem> statusList = <StatusItem>[].obs;

  void addImage(File file) {
    statusList.add(StatusItem(file: file, type: StatusType.image));
  }

  RxString profilePicUrl = "".obs;
  RxnString profilePicfile = RxnString();
  Future<void> pickAndUploadProfilePic(File file) async {
    try {
      profilePicfile.value = file.path;

      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      String userId = user.uid;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pics')
          .child('${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(file);

      String downloadUrl = await storageRef.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'profilePicUrl': downloadUrl,
      }, SetOptions(merge: true));
      profilePicUrl.value = downloadUrl;
      profilePicfile.value = null;
    } catch (e) {
      // print("Error uploading profile picture: $e");
    }
  }
}
