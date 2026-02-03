import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyCheckupScreen3 extends StatelessWidget {
  static const id = "/PrivacyCheckupScreen3";
  const PrivacyCheckupScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: context.watch<AppTheme>().whiteColor),
        ),
        title: Text(
          "Privacy checkup",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
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
              Icon(Icons.mail_lock, size: AppSize.getSize(70), color: context.watch<AppTheme>().greenAccentShade700),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Add more privacy to your chats",
                style: TextStyle(color: context.watch<AppTheme>().whiteColor, fontSize: AppSize.getSize(27)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.getSize(15)),
              Text(
                "For even more privacy, limit access to your messages and media with these privacy features.",
                style: TextStyle(color: context.watch<AppTheme>().greyShade400, fontSize: AppSize.getSize(16)),
                textAlign: TextAlign.center,
              ),
        
              SizedBox(height: AppSize.getSize(35)),
              appInfo(
                "App lock",
                "Require a fingerprint or face to open WhatsApp on your device.",
                Icons.fingerprint,
                () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AppLockScreen()));
                },context
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "Default message timer",
                "Start new chats with disappearing messages set to your timer",
                Icons.rotate_right_outlined,
                () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>DefaultMessageTimerScreen()));
                },context
              ),
              SizedBox(height: AppSize.getSize(30)),
              appInfo(
                "End-to-end encrypted backups",
                "Encrypt your backup so that nobody, not even Goggle or WhatsApp, will be able to access it.",
                Icons.lock_outline,
                () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdvancedScreen()));
                },context
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
    BuildContext context
  ) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSize.getSize(30), color: context.watch<AppTheme>().greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: context.watch<AppTheme>().whiteColor, fontSize: AppSize.getSize(18)),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: context.watch<AppTheme>().greyShade400, fontSize: AppSize.getSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(40)),
          Icon(Icons.arrow_forward, size: AppSize.getSize(25), color: context.watch<AppTheme>().greyShade400),
        ],
      ),
    );
  }
}
