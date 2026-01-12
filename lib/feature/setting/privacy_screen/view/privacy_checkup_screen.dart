import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen3.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen1.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen2.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen4.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PrivacyCheckupScreen extends StatelessWidget {
  const PrivacyCheckupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Privacy checkup",
          style: TextStyle(
            color: AppColors.whiteColor,
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
            SizedBox(height: AppSize.getSize(20)),
            Icon(
              Icons.privacy_tip_outlined,
              size: AppSize.getSize(70),
              color: AppColors.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Your privacy matters",
              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(22)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              "Control your privacy settings and set up WhatsApp just the way you want it.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(35)),
            appInfo(
              "Choose who can contacts you",
              Icons.add_ic_call_outlined,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyCheckupScreen1(),
                  ),
                );
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo("Cntrol your personal info", Icons.person_2_outlined, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyCheckupScreen2(),
                ),
              );
            }),
            SizedBox(height: AppSize.getSize(30)),
            appInfo("Add more privacy to your chats", Icons.message, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyCheckupScreen3(),
                ),
              );
            }),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Add more protection to your account",
              Icons.lock_clock_outlined,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacyCheckupScreen4(),
                  ),
                );
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
          ],
        ),
      ),
    );
  }

  Widget appInfo(String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: AppSize.getSize(28), color: AppColors.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
            ),
          ),
          SizedBox(width: AppSize.getSize(47)),
          Icon(Icons.arrow_forward, size: 28, color: AppColors.greyShade400),
        ],
      ),
    );
  }
}
