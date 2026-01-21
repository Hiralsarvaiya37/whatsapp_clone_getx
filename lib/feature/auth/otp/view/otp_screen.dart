import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/controller/otp_controller.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

class OtpScreen extends GetView<OtpController> {
  static const id = "/OtpScreen";
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(context.l10n.oTPScreen),
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
              controller: controller.otpController,
              decoration: InputDecoration(
                hintText: context.l10n.entertheOtp,
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
              controller.onOtpPress();
            },
            child: Text(context.l10n.oTP),
          ),
        ],
      ),
    );
  }
}
