import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class NewCommunityScreen extends StatelessWidget {
  static const id = "/NewCommunityScreen";
  const NewCommunityScreen({super.key});

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
          icon: Icon(
            Icons.close,
            color: theme.greyColor,
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
              color: theme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              "Create a new community",
              style: TextStyle(
                fontSize: AppSize.getSize(25),
                fontWeight: FontWeight.bold,
                color: theme.whiteColor,
              ),
            ),
            SizedBox(height: AppSize.getSize(12)),
            Text(
              "Bring together a neighborhood, school or more. Create topic-based groups for members, an easily send them admin announcements.",
              style: TextStyle(
                color: theme.greyShade400,
                fontSize: AppSize.getSize(18),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(8)),
            Text(
              "See example communities >",
              style: TextStyle(
                color: theme.blueshade500,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.blackColor,
        height: AppSize.getSize(65),
        child: Container(
          decoration: BoxDecoration(
            color: theme.greenAccentShade700,
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
