import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class VideoCallsScreen extends StatelessWidget {
  static const id = "/VideoCallsScreen";
  const VideoCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          "Video Calls",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: context.watch<AppTheme>().whiteColor,
            ),
            color: context.watch<AppTheme>().greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: context.watch<AppTheme>().whiteColor,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Video Calls",
                  style: TextStyle(
                    color: context.watch<AppTheme>().greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                appInfo("How to make a video call", context),
                SizedBox(height: AppSize.getSize(30)),
                appInfo("How to make a group video call", context),
                SizedBox(height: AppSize.getSize(30)),
                appInfo("How to share your screen", context),
              ],
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.file_open_sharp,
            size: AppSize.getSize(30),
            color: context.watch<AppTheme>().greyShade400,
          ),
          SizedBox(width: AppSize.getSize(30)),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: context.watch<AppTheme>().whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
