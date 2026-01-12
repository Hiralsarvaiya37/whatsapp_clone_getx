import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/accounts_and_account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/business_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/channles_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/connect_businesses_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/help_chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/help_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/payments_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/privacy_safety_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/search_help_center_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/show_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/view/voice_and_video_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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
          "Help center",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: AppSize.getSize(25), color: AppColors.whiteColor),
            color: AppColors.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Open in browser",
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.getSize(16),
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
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(25)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.call,
                          size: AppSize.getSize(60),
                          color: AppColors.greenAccentShade700,
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Text(
                          "How can we help?",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(22),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchHelpCenterScreen(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: AppSize.getSize(45),
                          width: MediaQuery.of(context).size.width * AppSize.getSize(0.88),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyColor, width: AppSize.getSize(1)),
                            borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: AppSize.getSize(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.search,
                                  size: AppSize.getSize(25),
                                  color: AppColors.greyShade400,
                                ),
                                SizedBox(width: AppSize.getSize(15)),
                                Text(
                                  "Search Help Center",
                                  style: TextStyle(
                                    color: AppColors.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(35)),
                  Text(
                    "Help topics",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GetStartedScreen(),
                        ),
                      );
                    },
                    child: appInfo("Get Started", Icons.flag),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpChatsScreen(),
                        ),
                      );
                    },
                    child: appInfo("Chats", Icons.chat_sharp),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConnectBusinessesScreen(),
                        ),
                      );
                    },
                    child: appInfo(
                      "Connect with Businesses",
                      Icons.add_business_outlined,
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoiceAndVideoCallsScreen(),
                        ),
                      );
                    },
                    child: appInfo("Voice and Video Calls", Icons.call),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpCommunitiesScreen(),
                        ),
                      );
                    },
                    child: appInfo("Communities", Icons.groups_2),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChannlesScreen(),
                        ),
                      );
                    },
                    child: appInfo("Channels", Icons.contactless_rounded),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacySafetyScreen(),
                        ),
                      );
                    },
                    child: appInfo("Privacy, Safety, and Security", Icons.lock),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountsAndAccountBansScreen(),
                        ),
                      );
                    },
                    child: appInfo(
                      "Accounts and Account Bans",
                      Icons.account_circle,
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentsScreen(),
                        ),
                      );
                    },
                    child: appInfo("Payments", Icons.payment),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessScreen(),
                        ),
                      );
                    },
                    child: appInfo("WhatsApp for Business", Icons.add_call),
                  ),
                  SizedBox(height: AppSize.getSize(35)),
                  Text(
                    "Popular articles",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  appTile(
                    "How to make a video call",
                    Icons.file_open_sharp,
                    context,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appTile(
                    "How to stay safe on WhatsApp",
                    Icons.file_open_sharp,
                    context,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appTile(
                    "About temporarily banned accounts",
                    Icons.file_open_sharp,
                    context,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appTile(
                    "About ads in WhatsApp Status and Channels",
                    Icons.file_open_sharp,
                    context,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Padding(
                    padding: EdgeInsets.only(left: AppSize.getSize(50)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowMoreScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            "Show more",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: AppSize.getSize(17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(50)),
                ],
              ),
            ),
          ),
         CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: AppSize.getSize(30), color: AppColors.greenAccentShade700),
        SizedBox(width: AppSize.getSize(20)),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppSize.getSize(17),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget appTile(String title, IconData icon, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LearnMoreScreen()),
        );
      },
      child: Row(
        children: [
          Icon(icon, size: AppSize.getSize(30), color: AppColors.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(17),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
