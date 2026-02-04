import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/provider/accessibility_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AnimationScreen extends StatelessWidget {
  static const id = "/AnimationScreen";
  const AnimationScreen({super.key});

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
          context.l10n.animation,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.whenturnedonemojistickersorGIFswillmoveautomatically,
              style: TextStyle(color: theme.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appTile(context.l10n.emoji, Icons.emoji_emotions_outlined, 1, context),
            SizedBox(height: AppSize.getSize(20)),
            appTile(context.l10n.stickers, Icons.sticky_note_2_outlined, 2, context),
            SizedBox(height: AppSize.getSize(20)),
            appTile(context.l10n.gifs, Icons.gif, 3, context),
          ],
        ),
      ),
    );
  }

  Widget appTile(String title, IconData icon, int index, BuildContext context) {
      final animationProvider = context.watch<AccessibilityViewProvider>();
       final theme = Provider.of<AppTheme>(context, listen: false);
     bool currentValue;
    if (index == 1) {
      currentValue = animationProvider.isOn1;
    } else if (index == 2) {
      currentValue = animationProvider.isOn2;
    } else {
      currentValue = animationProvider.isOn3;
    }
    return InkWell(
      onTap: () {
          if (index == 1) {
            animationProvider.isOn1 = !animationProvider.isOn1;
          } else if (index == 2) {
            animationProvider.isOn2 = !animationProvider.isOn2;
          } else {
            animationProvider.isOn3 = !animationProvider.isOn3;
          }
      },
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: AppSize.getSize(30), color: theme.whiteColor),
                SizedBox(width: AppSize.getSize(20)),
                Text(
                  title,
                  style: TextStyle(
                    color: theme.whiteColor,
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
         
             Switch(
              value: currentValue,
              activeThumbColor: theme.blackColor,
              activeTrackColor: theme.greenAccentShade700,
              inactiveTrackColor: theme.blackColor,
              onChanged: (val) {
                  if (index == 1) {
                    animationProvider.isOn1 = val;
                  } else if (index == 2) {
                    animationProvider.isOn2 = val;
                  } else {
                    animationProvider.isOn3 = val;
                  }
              },
            ),
          
        ],
      ),
    );

  }
}
