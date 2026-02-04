import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChannelAdminsScreen extends StatelessWidget {
  static const id = "/ChannelAdminsScreen";
  const ChannelAdminsScreen({super.key});

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
          context.l10n.channelAdmins,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: theme.whiteColor,
            ),
            color: theme.greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  context.l10n.openinbrowser,
                  style: TextStyle(
                    color: theme.whiteColor,
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
                    context.l10n.channelAdmins,
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(context.l10n.howtoshareachannelupdate, context),
                  appInfo(context.l10n.howtoeditchannelupdates, context),
                  appInfo(context.l10n.howtoforwardtoyourchannel, context),
                  appInfo(context.l10n.howtoforwardchannelinfoandsettings, context),
                  appInfo(context.l10n.howtoshareyourchannel, context),
                  appInfo(context.l10n.aboutchanneladmincontrols, context),
                  appInfo(context.l10n.howtocreatechannelpolls, context),
                  appInfo(context.l10n.howtoinviteanddismisschanneladmins, context),
                  appInfo(context.l10n.howtodeletechannelupdates, context),
                  appInfo(context.l10n.howtoseechannelmetricsandinsights, context),
                  appInfo(context.l10n.howtopinchannelsandstarupdates, context),
                  appInfo(
                    context.l10n.aboutbecomingapromotedchannelinthedirectory,
                    context,
                  ),
                  appInfo(
                    context.l10n.aboutaddingsubscriptionstoyourchannel,
                    context,
                  ),
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
     final theme = Provider.of<AppTheme>(context, listen: false);
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
              color: theme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: theme.whiteColor,
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
