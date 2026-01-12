import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PrivacyCheckupScreen3 extends StatelessWidget {
  const PrivacyCheckupScreen3({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.getSize(20)),
              Icon(Icons.mail_lock, size: AppSize.getSize(70), color: AppColors.greenAccentShade700),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Add more privacy to your chats",
                style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(27)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.getSize(15)),
              Text(
                "For even more privacy, limit access to your messages and media with these privacy features.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                textAlign: TextAlign.center,
              ),
        
              SizedBox(height: AppSize.getSize(35)),
              appInfo(
                "App lock",
                "Require a fingerprint or face to open WhatsApp on your device.",
                Icons.fingerprint,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppLockScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "Default message timer",
                "Start new chats with disappearing messages set to your timer",
                Icons.rotate_right_outlined,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefaultMessageTimerScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "End-to-end encrypted backups",
                "Encrypt your backup so that nobody, not even Goggle or WhatsApp, will be able to access it.",
                Icons.lock_outline,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvancedScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSize.getSize(30), color: AppColors.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(40)),
          Icon(Icons.arrow_forward, size: AppSize.getSize(25), color: AppColors.greyShade400),
        ],
      ),
    );
  }
}
