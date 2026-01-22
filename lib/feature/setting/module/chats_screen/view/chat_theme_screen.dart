import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatThemeScreen extends StatelessWidget {
  static const id = "/ChatThemeScreen";
  const ChatThemeScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          context.l10n.chattheme,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.more_vert, size:  AppSize.getSize(25), color: AppTheme.whiteColor),
          SizedBox(width:  AppSize.getSize(15)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:  AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.themes,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      themeBox(AppTheme.redColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.blueColor),
                      SizedBox(width: AppSize.getSize(15)),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(15)),
                  Row(
                    children: [
                      themeBox(AppTheme.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(AppTheme.redColor),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.getSize(30)),
            Text(
              context.l10n.thechatcolorandwallpaperwillbothchange,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Text(
              context.l10n.customize,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Padding(
              padding: EdgeInsets.only(left: AppSize.getSize(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.chat, size: AppSize.getSize(30), color: AppTheme.greyShade400),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        context.l10n.chatcolor,
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Row(
                    children: [
                      Icon(
                        Icons.wallpaper,
                        size: AppSize.getSize(30),
                        color: AppTheme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        context.l10n.wallpaper,
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget themeBox(Color color) {
    return Container(
      height: AppSize.getSize(110),
      width: AppSize.getSize(80),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
