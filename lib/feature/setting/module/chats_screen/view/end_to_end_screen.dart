import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class EndToEndScreen extends StatelessWidget {
  static const id = "/EndToEndScreen";
  const EndToEndScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.greyShade400),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(20)),
              child: Column(
                children: [
                  SizedBox(height: AppSize.getSize(20)),
                  Icon(
                    Icons.lock,
                    size: AppSize.getSize(70),
                    color: theme.greenAccentShade700,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Text(
                    context.l10n.addanextralayerofprotection,
                    style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(25)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.getSize(35)),
                  appInfo(
                    context.l10n.yourbackupwillbesafeevenifyouloseyourphone,
                    Icons.lock_outline,context
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  appInfo(
                    context.l10n.secureyourbackupwithapasskeypasswordoranencryptionkey,
                    Icons.key,context
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  appInfo(
                    context.l10n.nooneelsewillbeabletoaccessyourbackupNotevenWhatsApporGoogle,
                    Icons.remove_red_eye_outlined,context
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(10)),
            child: Column(
              children: [
                Container(
                  height: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: theme.greenAccentShade700,
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    context.l10n.usepasskey,
                    style: TextStyle(
                      color: theme.blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getSize(10)),
                 Container(
                  height: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.greyColor, width: AppSize.getSize(0.5)),
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    context.l10n.moreoptions,
                    style: TextStyle(
                      color: theme.greenAccentShade700,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon, BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, size: AppSize.getSize(30), color: theme.greyShade400),
        SizedBox(width: AppSize.getSize(30)),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
          ),
        ),
      ],
    );
  }
}
