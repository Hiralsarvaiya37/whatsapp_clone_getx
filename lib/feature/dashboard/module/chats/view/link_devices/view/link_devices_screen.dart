import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LinkDevicesScreen extends StatelessWidget {
  static const id = "/LinkDevicesScreen";
  const LinkDevicesScreen({super.key});

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
          "Linked devices",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(22),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(30),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.laptop_chromebook_outlined,
              size: AppSize.getSize(70),
              color: AppTheme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(20)),
            Text(
              "Use WhatsApp on other devices",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(25),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(10)),
            Text.rich(
              TextSpan(
                text:
                    "You can link other devices to this account, including Windows, Mac and Web. ",
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
                children: [
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: AppTheme.blueshade500,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              height: AppSize.getSize(40),
              decoration: BoxDecoration(
                color: AppTheme.greenAccentShade700,
                borderRadius: BorderRadius.circular(AppSize.getSize(30)),
              ),
              alignment: Alignment.center,
              child: Text(
                "Link a device",
                style: TextStyle(
                  fontSize: AppSize.getSize(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: AppSize.getSize(20),
                  color: AppTheme.greyShade400,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "Your personal messages are ",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(15),
                      ),
                      children: [
                        TextSpan(
                          text: "end-to-end-encrypted ",
                          style: TextStyle(
                            color: AppTheme.greenAccentShade700,
                            fontSize: AppSize.getSize(15),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: AppTheme.greyShade900,
                                builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.73,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSize.getSize(20),
                                        vertical: AppSize.getSize(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Center(
                                            child: Container(
                                              height: AppSize.getSize(5),
                                              width: AppSize.getSize(45),
                                              decoration: BoxDecoration(
                                                color: AppTheme.greyColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      AppSize.getSize(10),
                                                    ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: AppSize.getSize(20)),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              size: AppSize.getSize(25),
                                              color: AppTheme.greyShade400,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.lock_clock,
                                                size: AppSize.getSize(70),
                                                color: AppTheme
                                                    .greenAccentShade700,
                                              ),
                                              SizedBox(
                                                height: AppSize.getSize(25),
                                              ),
                                              Text(
                                                "Your chats and calls are private",
                                                style: TextStyle(
                                                  color: AppTheme.whiteColor,
                                                  fontSize: AppSize.getSize(22),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: AppSize.getSize(15),
                                              ),
                                              Text(
                                                "End-to-end encryption keeps your personal messages and calls between you and the people you choose. No one outside of the chat, not even WhatsApp, can read, listen to, or share them. This includes your:",
                                                style: TextStyle(
                                                  color: AppTheme.greyShade500,
                                                  fontSize: AppSize.getSize(18),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(
                                                height: AppSize.getSize(25),
                                              ),
                                              appInfo(
                                                Icons.message,
                                                "Text and voice messages",
                                              ),
                                              appInfo(
                                                Icons.call_outlined,
                                                "Audio and video calls",
                                              ),
                                              appInfo(
                                                Icons.attach_file,
                                                "Photos, videos and documents",
                                              ),
                                              appInfo(
                                                Icons.location_on_outlined,
                                                "Location sharing",
                                              ),
                                              appInfo(
                                                Icons.donut_large,
                                                "Status updates",
                                              ),
                                              SizedBox(
                                                height: AppSize.getSize(30),
                                              ),
                                              Container(
                                                height: AppSize.getSize(40),
                                                decoration: BoxDecoration(
                                                  color: AppTheme
                                                      .greenAccentShade700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        AppSize.getSize(30),
                                                      ),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Learn more",
                                                  style: TextStyle(
                                                    fontSize: AppSize.getSize(
                                                      16,
                                                    ),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                        ),
                        TextSpan(
                          text: "on all your devices.",
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(15),
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(IconData iconData, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.getSize(7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: AppSize.getSize(25),
            color: AppTheme.greyShade500,
          ),
          SizedBox(width: AppSize.getSize(20)),
          Text(
            title,
            style: TextStyle(
              color: AppTheme.greyShade500,
              fontSize: AppSize.getSize(17),
            ),
          ),
        ],
      ),
    );
  }
}
