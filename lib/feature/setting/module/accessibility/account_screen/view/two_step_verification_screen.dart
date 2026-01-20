import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class TwoStepVerificationScreen extends StatelessWidget {
   static const id="/TwoStepVerificationScreen";
  const TwoStepVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          "Two-step verification",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(15)),
            Icon(Icons.keyboard, size: AppSize.getSize(70), color: AppTheme.greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "For extra security, turn on two-step verification, which will require a PIN when registering your phone number with WhatsApp again.",

                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: AppTheme.blueshade500,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                       Get.toNamed(LearnMoreScreen.id);
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppTheme.blackColor,
        child: Center(
          child: Container(
            height: AppSize.getSize(45),
            width: AppSize.getSize(120),
            decoration: BoxDecoration(
              color: AppTheme.greenAccentShade700,
              borderRadius: BorderRadius.circular(AppSize.getSize(25)),
            ),
            alignment: Alignment.center,
            child: Text(
              "Turn on",
              style: TextStyle(color: AppTheme.blackColor, fontSize: AppSize.getSize(16), fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
