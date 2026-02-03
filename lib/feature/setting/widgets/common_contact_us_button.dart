import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class CommonContactUsButton extends StatelessWidget {
  const CommonContactUsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: AppSize.getSize(20),
      bottom: AppSize.getSize(20),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: context.watch<AppTheme>().greyShade900,
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
                          color: context.watch<AppTheme>().greyColor,
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(20),
                          ),
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(30)),
                      Icon(
                        Icons.help,
                        size: AppSize.getSize(50),
                        color: context.watch<AppTheme>().greenAccentShade700,
                      ),
                      SizedBox(height: AppSize.getSize(30)),
                      Text(
                        "Get help from official Whatsapp Support",
                        style: TextStyle(
                          color: context.watch<AppTheme>().whiteColor,
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
                            color: context.watch<AppTheme>().greyShade400,
                          ),
                          SizedBox(width: AppSize.getSize(20)),
                          Text(
                            "Secure chat with WhatsApp",
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
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
                            color: context.watch<AppTheme>().greyShade400,
                          ),
                          SizedBox(width: AppSize.getSize(20)),
                          Text(
                            "Answers may be AI generated",
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
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
                            color: context.watch<AppTheme>().greyShade400,
                          ),
                          SizedBox(width: AppSize.getSize(20)),
                          Text(
                            "Help us improve with feedback",
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
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
                                color: context.watch<AppTheme>().greyShade400,
                              ),
                            ),
                            TextSpan(
                              text: "Learn more",
                              style: TextStyle(
                                color: context.watch<AppTheme>().blueshade500,
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
                          color: context.watch<AppTheme>().greenAccentShade700,
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(20),
                          ),
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
                                color: context
                                    .watch<AppTheme>()
                                    .greenAccentShade700,
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
            color: context.watch<AppTheme>().greenAccentShade700,
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
    );
  }
}
