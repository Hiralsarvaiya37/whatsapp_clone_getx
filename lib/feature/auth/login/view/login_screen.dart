import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_controller.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

class LoginScreen extends GetView<LoginController> {
  static const id = "/LoginScreen";
   LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(context.l10n.phoneAuth),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              controller: controller.phoneController,
              decoration: InputDecoration(
                hintText: context.l10n.enterphonenumber,
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              controller.onVerifyNum(context);
            },
            child: Text(context.l10n.verifyphoneNumber),
          ),
        ],
      ),
    );
  }
}
