import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class TransferChatScreen extends StatelessWidget {
  static const id ="/TransferChatScreen";
  const TransferChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        actions: [
          Icon(Icons.more_vert, size: AppSize.getSize(25), color: AppTheme.greyShade400),
          SizedBox(width: AppSize.getSize(10)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(28), vertical: AppSize.getSize(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: AppSize.getSize(10)),
                  Icon(
                    Icons.history_edu,
                    size: AppSize.getSize(75),
                    color: AppTheme.greenAccentShade700,
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Text(
                    context.l10n.transferchathistorytonewphone,
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(23)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSize.getSize(20)),
                  Text(
                    context.l10n.transferyourchathistoryprivatelytoanotherAndroidphoneHaveyourmostuptodatemessageswithoutusingGooglestorageCertaindevicepermissionsareneededtoConnecttoyournewdevice,
                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(28), vertical: AppSize.getSize(15)),
            child: Column(
              children: [
                Container(
                  height: AppSize.getSize(40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccentShade700,
                    borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                  ),alignment: Alignment.center,
                  child: Text(
                    context.l10n.starred,
                    style: TextStyle(fontSize: AppSize.getSize(16), fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: AppSize.getSize(10)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    context.l10n.cancel,
                    style: TextStyle(color: AppTheme.greenAccentShade700,fontSize: AppSize.getSize(16), fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
