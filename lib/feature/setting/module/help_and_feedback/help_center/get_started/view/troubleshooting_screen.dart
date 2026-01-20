import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class TroubleshootingScreen extends StatelessWidget {
  static const id = "/TroubleshootingScreen";
  const TroubleshootingScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Troubleshooting",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppTheme.whiteColor,
            ),
            color: AppTheme.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(20),
                vertical: AppSize.getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Troubleshooting",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("Not seeing a feature on WhatsApp", context),
                  appInfo("Fixing issues on WhatsApp", context),
                  appInfo("How to fix connection issues", context),
                  appInfo("Can't download or update WhatsApp", context),
                  appInfo("How to manually update WhatsApp", context),
                  appInfo("Can't change phone number", context),
                  appInfo("Can't log out of WhatsApp", context),
                  appInfo("Contact names missing", context),
                  appInfo("Can't see a contact's profile information", context),
                  appInfo("How to recover lost contacts", context),
                  appInfo("Don't recognize contact's account", context),
                  appInfo("Seeing 'Your devices were logged out' ", context),
                  appInfo("Seeing 'You have been logged out' ", context),
                  appInfo(
                    "Seeing 'You have been logged out for your account security ",
                    context,
                  ),
                  appInfo("About using WhatsApp abroad", context),
                  appInfo("About WhatsApp support languages ", context),
                  appInfo(
                    "About the languages WhatsApp is available in",
                    context,
                  ),
                  appInfo("Can't use keyboard in WhatsApp", context),
                  appInfo("About accessibility features on WhatsApp", context),
                  appInfo("About task manager errors", context),
                  appInfo("Can't move WhatsApp to an SD card", context),
                  appInfo(
                    "What information does WhatsApp collect when reporting an issue",
                    context,
                  ),
                  appInfo("How to report an issu to WhatsApp", context),
                  appInfo(
                    "About support for WhatsApp and other Meta Company products",
                    context,
                  ),
                  SizedBox(height: AppSize.getSize(40)),
                ],
              ),
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, BuildContext context) {
    return InkWell(
      onTap: () {
      Get.toNamed(LearnMoreScreen.id);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppTheme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.getSize(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
