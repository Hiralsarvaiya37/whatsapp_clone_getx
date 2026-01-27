import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class NewCommunityScreen extends StatelessWidget {
  static const id = "/NewCommunityScreen";
  const NewCommunityScreen({super.key});

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
            Icons.close,
            color: AppTheme.greyColor,
            size: AppSize.getSize(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(30),
          vertical: AppSize.getSize(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.groups_2_rounded,
              size: AppSize.getSize(90),
              color: AppTheme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              "Create a new community",
              style: TextStyle(
                fontSize: AppSize.getSize(25),
                fontWeight: FontWeight.bold,
                color: AppTheme.whiteColor,
              ),
            ),
            SizedBox(height: AppSize.getSize(12)),
            Text(
              "Bring together a neighborhood, school or more. Create topic-based groups for members, an easily send them admin announcements.",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(18),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(8)),
            Text(
              "See example communities >",
              style: TextStyle(
                color: AppTheme.blueshade500,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.blackColor,
        height: AppSize.getSize(65),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.greenAccentShade700,
            borderRadius: BorderRadius.circular(AppSize.getSize(40)),
          ),
          alignment: Alignment.center,
          child: Text(
            "Get started",
            style: TextStyle(
              fontSize: AppSize.getSize(16),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
