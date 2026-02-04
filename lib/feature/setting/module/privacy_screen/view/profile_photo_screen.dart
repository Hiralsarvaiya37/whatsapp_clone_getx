import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ProfilePhotoScreen extends StatelessWidget {
  static const id = "/ProfilePhotoScreen";
  const ProfilePhotoScreen({super.key});

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
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          "Profile photo",
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who can see my profile photo",
              style: TextStyle(
                color: theme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            radioTile("Everyone", context),
            SizedBox(height: AppSize.getSize(20)),
            radioTile("My contacts", context),
            SizedBox(height: AppSize.getSize(20)),
            radioTile("My contacts except...", context),
            SizedBox(height: AppSize.getSize(20)),
            radioTile("Nobody", context),
          ],
        ),
      ),
    );
  }

  Widget radioTile(String title, BuildContext context) {
    final provider = context.watch<PrivacyViewProvider>();
     final theme = Provider.of<AppTheme>(context, listen: false);
    bool isSelected = provider.selectedLastSeen == title;
    return InkWell(
      onTap: () {
        provider.updateLastSeen(title);
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSize.getSize(20)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected
                      ? theme.greenAccentShade700
                      : theme.greyColor,
                  width: AppSize.getSize(2),
                ),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.greenAccentShade700,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),

            SizedBox(width: AppSize.getSize(15)),

            Text(
              title,
              style: TextStyle(
                color: theme.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
