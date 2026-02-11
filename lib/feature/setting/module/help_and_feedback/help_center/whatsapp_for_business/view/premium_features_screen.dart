import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PremiumFeaturesScreen extends StatelessWidget {
  static const id ="/PremiumFeaturesScreen";
  const PremiumFeaturesScreen({super.key});

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
          "WhatsApp Premium Features",
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
            offset: Offset(0, AppSize.getSize(45)),
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
                    "WhatsApp Premium Features",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),

                  appInfo(
                    "About Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "How to subscribe to Meta Verified for business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "About eligibility requirements for Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "About updating business name and profile picture for Meta Verified businesses",
                    context,
                  ),
                  appInfo(
                    "How to manage or cancel your Meta Verified subscription for businesses only on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "Can't make payment for Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "Can't complete verification for Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "About payments for Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "About refunds for Meta Verified for Business on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "How to create a verified channel on the WhatsApp business app",
                    context,
                  ),
                  appInfo("About verified business accounts", context),
                  appInfo("About connecting with businesses", context),
                  appInfo("About web pages for verified businesses", context),
                  appInfo("About multi-agent", context),
                  appInfo(
                    "How to manage requests from accounts associated with business accounts on Facebook or Instagram",
                    context,
                  ),
                  appInfo(
                    "How to get help with Meta Verified for businesses on WhatsApp",
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
