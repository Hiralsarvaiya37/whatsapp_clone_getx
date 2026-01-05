import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

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
          "Media",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.search, size: AppSize.getSize(25), color: AppColors.whiteColor),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: AppSize.getSize(25), color: AppColors.whiteColor),
            color: AppColors.greyShade900,
            offset: Offset(0, 45),
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
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Media",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("How to send media, contacts, or location", context),
                  appInfo("Finding media files", context),
                  appInfo("How to forward media", context),
                  appInfo("How to edit photos and videos", context),
                  appInfo("How to stop WhatsApp from saving media to your phone", context),
                  appInfo("How to use stickers", context),
                  appInfo("How to create and share custom stickers and sticker packs", context),
                  appInfo("How to create avatars", context),
                  appInfo("How to use avatars", context),
                  appInfo("How to create GIFs", context),
                  appInfo("How to send GIFs", context),
                  appInfo("How to use emoji", context),
                  appInfo("How to configure auto-download", context),
                  SizedBox(height: AppSize.getSize(40))
                ],
              ),
            ),
          ),
          Positioned(
            right: AppSize.getSize(20),
            bottom: AppSize.getSize(20),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: AppColors.greyShade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(AppSize.getSize(20)),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.getSize(25),
                        vertical: AppSize.getSize(10),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: AppSize.getSize(5),
                              width: AppSize.getSize(40),
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(30)),
                            Icon(
                              Icons.help,
                              size: AppSize.getSize(50),
                              color: AppColors.greenAccentShade700,
                            ),
                            SizedBox(height: AppSize.getSize(30)),
                            Text(
                              "Get help from official Whatsapp Support",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: AppSize.getSize(25),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: AppSize.getSize(30)),
                            Row(
                              children: [
                                Icon(
                                  Icons.security,
                                  size: AppSize.getSize(25),
                                  color: AppColors.greyShade400,
                                ),
                                SizedBox(width: AppSize.getSize(20)),
                                Text(
                                  "Secure chat with WhatsApp",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.getSize(25)),
                            Row(
                              children: [
                                Icon(
                                  Icons.switch_access_shortcut_add_outlined,
                                  size: AppSize.getSize(25),
                                  color: AppColors.greyShade400,
                                ),
                                SizedBox(width: AppSize.getSize(20)),
                                Text(
                                  "Answers may be AI generated",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.getSize(25)),
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  size: AppSize.getSize(25),
                                  color: AppColors.greyShade400,
                                ),
                                SizedBox(width: AppSize.getSize(20)),
                                Text(
                                  "Help us improve with feedback",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.getSize(20)),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "Some answers are generated by AI using a secure technology from Meta. WhatsApp uses your messages with WhatsApp Support to provide you with relevant answers. Your personal messages and calls remain end-to-end encrypted. ",
                                    style: TextStyle(
                                      color: AppColors.greyShade400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Learn more",
                                    style: TextStyle(
                                      color: AppColors.blueshade500,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: AppSize.getSize(30)),
                            Container(
                              height: AppSize.getSize(40),
                              decoration: BoxDecoration(
                                color: AppColors.greenAccentShade700,
                                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Start chat",
                                style: TextStyle(
                                  fontSize: AppSize.getSize(15),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(15)),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Not now",
                                    style: TextStyle(
                                      color: AppColors.greenAccentShade700,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSize.getSize(15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: AppSize.getSize(55),
                width: AppSize.getSize(150),
                decoration: BoxDecoration(
                  color: AppColors.greenAccentShade700,
                  borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(15)),
                  child: Row(
                    children: [
                      Icon(Icons.help_center, size: AppSize.getSize(20)),
                      SizedBox(width: AppSize.getSize(10)),
                      Text(
                        "Contact us",
                        style: TextStyle(
                          fontSize: AppSize.getSize(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
        padding:  EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.file_open_sharp, size: AppSize.getSize(30), color: AppColors.greyShade400),
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
