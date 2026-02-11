import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class IndividualAndGroupchatsScreen extends StatelessWidget {
  static const id = "/IndividualAndGroupchatsScreen";
  const IndividualAndGroupchatsScreen({super.key});

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
          context.l10n.individualandGroupChats,
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
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
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
                    context.l10n.individualandGroupChats,
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(context.l10n.howtoreplytoamessage, context),
                  appInfo(context.l10n.howtodeletechats, context),
                  appInfo(context.l10n.howtoclearchats, context),
                  appInfo(context.l10n.howtopinorunpinachat, context),
                  appInfo(context.l10n.howtoeditfavoritesfromtheChatstab, context),
                  appInfo(context.l10n.aboutlists, context),
                  appInfo(context.l10n.howtouselists, context),
                  appInfo(context.l10n.howtouseclicktochat, context),
                  appInfo(context.l10n.howtodeletemessages, context),
                  appInfo(context.l10n.howtoforwardmessages, context),
                  appInfo(context.l10n.aboutforwardinglimits, context),
                  appInfo(context.l10n.howtopinamessages, context),
                  appInfo(context.l10n.howtomessageyourself, context),
                  appInfo(context.l10n.howtoforwardmessages, context),
                  appInfo(context.l10n.howtoformatyourmessages, context),
                  appInfo(context.l10n.howtochangeyourapporchattheme, context),
                  appInfo(context.l10n.aboutdisappearingmessages, context),
                  appInfo(
                    context.l10n.howtoturndisappearingmessagesonoroff,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtoturndisappearingmessagesonoroffinagroup,
                    context,
                  ),
                  appInfo(context.l10n.aboutviewonce, context),
                  appInfo(
                    context.l10n.howtosendandopenviewoncemediaandvoicemessages,
                    context,
                  ),
                  appInfo(context.l10n.howtocreateandinviteintoagroup, context),
                  appInfo(
                    context.l10n.howtoarchiveorunarchiveachatorgroup,
                    context,
                  ),
                  appInfo(context.l10n.howtochangegroupadminsettings, context),
                  appInfo(context.l10n.turnchatlockonoroff, context),
                  appInfo(context.l10n.howtoexitanddeletegroupsasanadmin, context),
                  appInfo(context.l10n.howtoexitagroupasamember, context),
                  appInfo(context.l10n.howtoaddandremovegroupmembers, context),
                  appInfo(context.l10n.howtomakechangestogroupsr, context),
                  appInfo(context.l10n.howtomentioninagroup, context),
                  appInfo(context.l10n.howtomanagegroupadmins, context),
                  appInfo(context.l10n.howtorejoinagroupchat, context),
                  appInfo(context.l10n.aboutgroupjoinrequests, context),
                  appInfo(context.l10n.howtocreateandediteventsingroups, context),
                  appInfo(context.l10n.howtorespondtoevents, context),
                  appInfo(context.l10n.howtousepolls, context),
                  appInfo(context.l10n.howtouselivelocation, context),
                  appInfo(context.l10n.howtosearchWhatsApp, context),
                  appInfo(context.l10n.howtocheckreadreceipts, context),
                  appInfo(context.l10n.howtousebroadcastlists, context),
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
