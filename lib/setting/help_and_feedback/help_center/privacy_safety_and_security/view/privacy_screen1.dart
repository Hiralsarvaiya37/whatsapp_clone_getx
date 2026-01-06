import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PrivacyScreen1 extends StatelessWidget {
  const PrivacyScreen1({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Privacy",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppColors.whiteColor,
            ),
            color: AppColors.greyShade900,
            offset:  Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
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
                    "Privacy",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("About end-to-end encryption", context),
                  appInfo("About privacy checkup", context),
                  appInfo("How to change your privacy settings", context),
                  appInfo("How to change group privacy settings", context),
                  appInfo(
                    "How to protect your IP address on WhatsApp calls",
                    context,
                  ),
                  appInfo("Does WhatsApp collect or sell your data?", context),
                  appInfo("About advanced chat privacy", context),
                  appInfo(
                    "Privacy at a Glance: Additional information about the updates Tab",
                    context,
                  ),
                  appInfo("How to silence unknown callers", context),
                  appInfo("About last seen and online", context),
                  appInfo("About WhatsApp permissions", context),
                  appInfo("How to use app lock", context),
                  appInfo("About sharing your device's location", context),
                  appInfo(
                    "What is traceability and why does WhatsApp oppose it?",
                    context,
                  ),
                  appInfo("About DIT.WhatsAPp.Net?", context),
                  appInfo(
                    "About using optional Meta Company Products if you opted out of sharing WhatsApp account information with Meta",
                    context,
                  ),
                  appInfo(
                    "Why am i seeing a new system message in my WhatsApp chats?",
                    context,
                  ),
                  appInfo(
                    "Explaining Apple and Android App Privacy Reports",
                    context,
                  ),
                  appInfo(
                    "Unpacking WhatsApp's privacy label in the Apple App Store",
                    context,
                  ),
                  appInfo("About goverment requests for user data", context),
                  appInfo("Yearly reminder for users in india", context),
                  appInfo(
                    "About mandatory disclosures to be made by Businesses in india",
                    context,
                  ),
                  appInfo(
                    "Learn about what categories of data are available in your 'Request Account info' report",
                    context,
                  ),
                  appInfo(
                    "What information does WhatsApp collect when you contact support?",
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LearnMoreScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppColors.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
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
