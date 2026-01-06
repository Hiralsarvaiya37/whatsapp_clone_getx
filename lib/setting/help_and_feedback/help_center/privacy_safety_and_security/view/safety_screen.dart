import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

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
          "Safety",
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
            offset: Offset(0, AppSize.getSize(45)),
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
                    "Safety",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("How to block and report someone", context),
                  appInfo("About reporting and blocking on WhatsApp", context),
                  appInfo("How to block a group admin", context),
                  appInfo("Being blocked by someone", context),
                  appInfo("How to report someone's status update", context),
                  appInfo("About suspicious messages and scams", context),
                  appInfo(
                    "How to protect yourself from suspicious messages and scams",
                    context,
                  ),
                  appInfo("How to use WhatsApp responsibly", context),
                  appInfo(
                    "5 Tips to keep your WhatsApp account safe and secure",
                    context,
                  ),
                  appInfo(
                    "How safe & secure is WhatsApp? Privacy explained",
                    context,
                  ),
                  appInfo("How to stay safe on WhatsApp", context),
                  appInfo("How to stay safe in groups on WhatsApp", context),
                  appInfo(
                    "How to block high volumes of unknown messages",
                    context,
                  ),
                  appInfo("About unofficial apps", context),
                  appInfo("About suspicious links", context),
                  appInfo("About suspicious files", context),
                  appInfo("About the official WhatsApp chat account", context),
                  appInfo(
                    "About the official WhatsApp Business account",
                    context,
                  ),
                  appInfo(
                    "About safely communicating with WhatsApp Support",
                    context,
                  ),
                  appInfo("About harvesting personal information", context),
                  appInfo(
                    "IFCN fact-checking organizations on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "How to prevent the spread of misinformation",
                    context,
                  ),
                  appInfo("About minimum age to use WhatsApp", context),
                  appInfo("How to protect your account from malware", context),
                  appInfo("About WhatsAPp and elections", context),
                  appInfo(
                    "Unauthorized use of automated or bulk messaging on WhatsApp",
                    context,
                  ),
                  appInfo(
                    "How WhatsApp Helps Fight Child Exploitation",
                    context,
                  ),
                  appInfo("Ensuring user safety in india on WhatsApp", context),
                  appInfo("Keeping WhatsApp Users safe in indonesia", context),
                  appInfo("About detecting violations", context),
                  appInfo("Global Suicide hotline Resources", context),
                  appInfo(
                    "Information for Law Enforcement Authorities",
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
          MaterialPageRoute(builder: (context) => LearnMoreScreen()),
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
