import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:whatsapp_clone_getx/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/utils/helper/firestore_helper.dart';

class AuthCtr extends GetxController {
  FirestoreHelper firestoreHelper = FirestoreHelper();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  Future<void> onAuth() async {
    String uuid = Uuid().v4();

    await firestoreHelper.addNewUser(
      uuid: uuid,
      name: nameCtr.text,
      emailOrNum: emailCtr.text,
      pass: passCtr.text,
      onError: () {},
      sucess: () {
        ///GEt storge

        Get.to(DashboardScreen());
      },
    );
  }
}
