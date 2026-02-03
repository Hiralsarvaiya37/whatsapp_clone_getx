import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatTroubleshootingScreen extends StatelessWidget {
  static const id  = "/ChatTroubleshootingScreen";
  const ChatTroubleshootingScreen({super.key});

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
          context.l10n.troubleshooting,
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
                  context.l10n.openinbrowser,
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
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(20),
                vertical: AppSize.getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.troubleshooting,
                    style: TextStyle(
                      color: context.watch<AppTheme>().greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(context.l10n.cantsendorreceivemessages, context),
                  appInfo(
                    context.l10n.aboutWaitingforthismessageThismaytakeawhile,
                    context,
                  ),
                  appInfo(
                    context.l10n.seeingWaitingforthismessageCheckyourphone,
                    context,
                  ),
                  appInfo(context.l10n.fixincorrecttimestampsonmessages, context),
                  appInfo(
                    context.l10n.cantrememberpasswordforencryptedbackup,
                    context,
                  ),
                  appInfo(
                    context.l10n.cantbackuporrestoreyourchathistory,
                    context,
                  ),
                  appInfo(
                    context.l10n.cantmovechatsfromanAndroiddevicetoaniPhone,
                    context,
                  ),
                  appInfo(
                    context.l10n.cantmovechatsfromaniPhonetoanAndroiddevice,
                    context,
                  ),
                  appInfo(context.l10n.canttransferchathistory, context),
                  appInfo(context.l10n.cantchangeorassignagroupadmin, context),
                  appInfo(context.l10n.cantdownloadopenorsendmediafiles, context),
                  appInfo(
                    context.l10n.canthearvoicemessagesstatusaudioorvideos,
                    context,
                  ),
                  appInfo(context.l10n.cantrecordvoicemessages, context),
                  appInfo(context.l10n.seeingblurryphotos, context),
                  appInfo(context.l10n.cantsendlongervideos, context),
                  appInfo(
                    context.l10n.whatdoesInviteviaLinkunavailablemean,
                    context,
                  ),
                  appInfo(context.l10n.cantjoingroupwithinvitelink, context),
                  appInfo(context.l10n.howtoedityourprofile, context),
                  appInfo(context.l10n.howtofreeupstorageonWhatsApp, context),
                  appInfo(context.l10n.howtochnageyourringtoneforWhatsApp, context),
                  appInfo(context.l10n.howtousedarkmode, context),
                  appInfo(context.l10n.howtochangefontsize, context),
                  SizedBox(height: AppSize.getSize(40)),
                ],
              ),
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
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
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
      ),
    );
  }
}
