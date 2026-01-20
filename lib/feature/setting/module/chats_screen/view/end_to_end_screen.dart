import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class EndToEndScreen extends StatelessWidget {
  static const id = "/EndToEndScreen";
  const EndToEndScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.greyShade400),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(20)),
              child: Column(
                children: [
                  SizedBox(height: AppSize.getSize(20)),
                  Icon(
                    Icons.lock,
                    size: AppSize.getSize(70),
                    color: AppTheme.greenAccentShade700,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Text(
                    "Add an extra layer of protection",
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(25)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.getSize(35)),
                  appInfo(
                    "Your backup will be safe, even if you lose your phone.",
                    Icons.lock_outline,
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  appInfo(
                    "Secure your backup with a passkey, password or an encryption key.",
                    Icons.key,
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  appInfo(
                    "No one else will be able to access your backup. Not even WhatsApp or Google.",
                    Icons.remove_red_eye_outlined,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(10)),
            child: Column(
              children: [
                Container(
                  height: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccentShade700,
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Use passkey",
                    style: TextStyle(
                      color: AppTheme.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getSize(10)),
                 Container(
                  height: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.greyColor, width: AppSize.getSize(0.5)),
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "More options",
                    style: TextStyle(
                      color: AppTheme.greenAccentShade700,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: AppSize.getSize(30), color: AppTheme.greyShade400),
        SizedBox(width: AppSize.getSize(30)),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
          ),
        ),
      ],
    );
  }
}
