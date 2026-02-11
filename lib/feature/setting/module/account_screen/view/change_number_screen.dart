import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChangeNumberScreen extends StatelessWidget {
  static const id="/ChangeNumberScreen";
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        backgroundColor: AppTheme.blackColor,
        title: Text(
          context.l10n.changenumber,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(30), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  size: AppSize.getSize(70),
                  color: AppTheme.greenAccentShade700,
                ),
                Text(
                  "...",
                  style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(40)),
                ),
                Icon(
                  Icons.upload_file_rounded,
                  size: AppSize.getSize(70),
                  color: AppTheme.greenAccentShade100,
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(40)),
            Text(
              context.l10n.changingyourphonenumberwillmigrateyouraccountinfogroupssettings,
              style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(20)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              context.l10n.beforeproceedingpleaseconfirmthatyouareabletoreceiveSMScallsatyournewnumber,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              context.l10n.ifyouhavebothanewphoneanewnumberfirstchangeyournumberonyouroldphone,
              style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.blackColor,
        child: Center(
          child: Container(
            height: AppSize.getSize(43),
            width: AppSize.getSize(90),
            decoration: BoxDecoration(
              color: AppTheme.greenAccentShade700,
              borderRadius: BorderRadius.circular(AppSize.getSize(25)),
            ),
            alignment: Alignment.center,
            child: Text(context.l10n.next, style: TextStyle(color: AppTheme.blackColor,fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
