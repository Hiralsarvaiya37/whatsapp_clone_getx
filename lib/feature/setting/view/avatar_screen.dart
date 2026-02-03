import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AvatarScreen extends StatelessWidget {
  static const id = "/AvatarScreen";
  const AvatarScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: context.watch<AppTheme>().whiteColor),
        ),
        title: Text(
          context.l10n.avatar,
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.getSize(20)),
            Icon(Icons.groups, size: AppSize.getSize(80), color: context.watch<AppTheme>().greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.saymorewithAvatarsnowonWhatsApp,
                  style: TextStyle(color: context.watch<AppTheme>().whiteColor, fontSize: AppSize.getSize(17)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(15)),
            Container(
              height: AppSize.getSize(43),
              decoration: BoxDecoration(
                color: context.watch<AppTheme>().greenAccentShade700,
                borderRadius: BorderRadius.circular(AppSize.getSize(30)),
              ),
              alignment: Alignment.center,
              child: Text(
                context.l10n.createyourAvatar,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: AppSize.getSize(16)),
              ),
            ),

            SizedBox(height: AppSize.getSize(45)),
            Row(
              children: [
                Text(
                  context.l10n.learnmore,
                  style: TextStyle(
                    color: context.watch<AppTheme>().blueshade500,
                    fontSize: AppSize.getSize(18),
                    decoration: TextDecoration.underline,
                    decorationColor: context.watch<AppTheme>().blueshade500
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
