import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatThemeScreen extends StatelessWidget {
  static const id = "/ChatThemeScreen";
  const ChatThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.whiteColor),
        ),
        title: Text(
          context.l10n.chattheme,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.more_vert, size:  AppSize.getSize(25), color: theme.whiteColor),
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
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      themeBox(theme.redColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.blueColor),
                      SizedBox(width: AppSize.getSize(15)),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(15)),
                  Row(
                    children: [
                      themeBox(theme.pinkColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.orangeColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.deeppurpleColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.yellowColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.greenColor),
                      SizedBox(width: AppSize.getSize(15)),
                      themeBox(theme.redColor),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.getSize(30)),
            Text(
              context.l10n.thechatcolorandwallpaperwillbothchange,
              style: TextStyle(color: theme.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Text(
              context.l10n.customize,
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Padding(
              padding: EdgeInsets.only(left: AppSize.getSize(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.chat, size: AppSize.getSize(30), color: theme.greyShade400),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        context.l10n.chatcolor,
                        style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Row(
                    children: [
                      Icon(
                        Icons.wallpaper,
                        size: AppSize.getSize(30),
                        color: theme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        context.l10n.wallpaper,
                        style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
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
