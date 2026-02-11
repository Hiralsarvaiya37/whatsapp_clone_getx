import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChangeNumberScreen extends StatelessWidget {
  static const id="/ChangeNumberScreen";
  const ChangeNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.whiteColor),
        ),
        backgroundColor: theme.blackColor,
        title: Text(
          context.l10n.changenumber,
          style: TextStyle(
            color: theme.whiteColor,
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
                  color: theme.greenAccentShade700,
                ),
                Text(
                  "...",
                  style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(40)),
                ),
                Icon(
                  Icons.upload_file_rounded,
                  size: AppSize.getSize(70),
                  color: theme.greenAccentShade100,
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(40)),
            Text(
              context.l10n.changingyourphonenumberwillmigrateyouraccountinfogroupssettings,
              style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(20)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              context.l10n.beforeproceedingpleaseconfirmthatyouareabletoreceiveSMScallsatyournewnumber,
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              context.l10n.ifyouhavebothanewphoneanewnumberfirstchangeyournumberonyouroldphone,
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.blackColor,
        child: Center(
          child: Container(
            height: AppSize.getSize(43),
            width: AppSize.getSize(90),
            decoration: BoxDecoration(
              color: theme.greenAccentShade700,
              borderRadius: BorderRadius.circular(AppSize.getSize(25)),
            ),
            alignment: Alignment.center,
            child: Text(context.l10n.next, style: TextStyle(color: theme.blackColor,fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}
