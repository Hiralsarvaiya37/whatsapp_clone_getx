import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/updateview_provider.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';

class SettingProvider extends ChangeNotifier {
  bool isShow = false;
  String selectedTheme = "System default";
  String selectedFontSize = "Medium";
  LanguageEnum selectedLanguage = LanguageEnum.en;

  List<bool> isOn4 = List.generate(9, (_) => false);

  String selectedoption = "Default";
  String selectedoption1 = "White";

  List<StatusItem> statusList = [];

  String profilePicUrl = "";
  String? profilePicFile;
  Map<String, bool> selectedItems = {
    "Photos": false,
    "Audio": false,
    "Video": false,
    "Documents": false,
  };

  SettingProvider() {
    loadCurrentProfilePic();
  }

  void changeLanguage(LanguageEnum lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

  bool _isShow1 = false;

  bool get isShow1 => _isShow1;

  set isShow1(bool val) {
    _isShow1 = val;
    notifyListeners();
  }

  void toggleNotification(int index, bool val) {
    isOn4[index] = val;
    notifyListeners();
  }

  bool _isShow2 = false;

  bool get isShow2 => _isShow2;

  set isShow2(bool val) {
    _isShow2 = val;
    notifyListeners();
  }

  bool _isShow3 = false;

  bool get isShow3 => _isShow3;

  set isShow3(bool val) {
    _isShow3 = val;
    notifyListeners();
  }

  bool _isOn = false;

  bool get isOn => _isOn;

  set isOn(bool val) {
    _isOn = val;
    notifyListeners();
  }

  bool _isOn1 = false;

  bool get isOn1 => _isOn1;

  set isOn1(bool val) {
    _isOn1 = val;
    notifyListeners();
  }

  bool _isOn2 = false;

  bool get isOn2 => _isOn2;

  set isOn2(bool val) {
    _isOn2 = val;
    notifyListeners();
  }

  bool _isOn3 = false;

  bool get isOn3 => _isOn3;

  set isOn3(bool val) {
    _isOn3 = val;
    notifyListeners();
  }

  void addImage(File file) {
    statusList.add(StatusItem(file: file, type: StatusType.image));
    notifyListeners();
  }

  Future<void> loadCurrentProfilePic() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    if (doc.exists && doc.data()!.containsKey('profilePicUrl')) {
      profilePicUrl = doc['profilePicUrl'];
      notifyListeners();
    }
  }

  Future<void> pickAndUploadProfilePic(File file) async {
    try {
      profilePicFile = file.path;
      notifyListeners();

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

      profilePicUrl = downloadUrl;
      profilePicFile = null;
      notifyListeners();
    } catch (e) {
      // print("Error: $e");
    }
  }
}
