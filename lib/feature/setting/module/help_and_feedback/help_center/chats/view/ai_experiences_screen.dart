import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AiExperiencesScreen extends StatelessWidget {
  static const id = "/AiExperiencesScreen";
  const AiExperiencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.aIExperiences,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppTheme.whiteColor,
            ),
            color: AppTheme.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  context.l10n.openinbrowser,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
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
                    context.l10n.aIExperiences,
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(
                    context.l10n.aboutAIexperiencesavailablethroughWhatsApp,
                    context,
                  ),
                  appInfo(
                    context.l10n.aboutusingAIexperiencesavailablethroughWhatsApp,
                    context
                  ),
                  appInfo(context.l10n.aboutMetaAI, context),
                  appInfo(context.l10n.howtochatwithMetaAI, context),
                  appInfo(
                    context.l10n.howtochatwithMetaAIinanindividualorgroupchat,
                    context,
                  ),
                  appInfo(
                    context.l10n.aboutsearchingWhatsAppandaskingMetaAI,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtoaskMetaAIintheWhatsAppsearchbar,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtocreateananimatedAIimageinachat,
                    context,
                  ),
                  appInfo(
                   context.l10n.howtogenerateanAIimageforyourprofilephotoorgroupicon,
                    context,
                  ),
                  appInfo(context.l10n.howtoeditAIgeneratedimages, context),
                  appInfo(
                    context.l10n.howtoedityourphotosorimageswithMetaAI,
                    context,
                  ),
                  appInfo(context.l10n.howtopromptMetaAIwithanimage, context),
                  appInfo(
                    context.l10n.howtocreateanduseAIgeneratedcallbackgrounds,
                    context,
                  ),
                  appInfo(
                   context.l10n.howtoshareanAIgeneratedimagetoyourstatus,
                    context,
                  ),
                  appInfo(context.l10n.aboutAIs, context),
                  appInfo(context.l10n.howtochatwithAIs, context),
                  appInfo(context.l10n.howtoreportanAI, context),
                  appInfo(
                    context.l10n.aboutcreatinganAIthroughMetaAIStudio,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtocreateanAIthroughMetaAIstudio,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtoedityourAIthroughMetaAIStudio,
                    context,
                  ),
                  appInfo(
                   context.l10n.howtodeleteyourAIthroughMetaAIStudio,
                    context,
                  ),
                  appInfo(context.l10n.aboutAIstickers, context),
                  appInfo(context.l10n.howtocreateandshareAIstickers, context),
                  appInfo(
                    context.l10n.abouttheavailbilityofAIexperiencesavailablethroughWhatsApp,
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
    return InkWell(
      onTap: () {
        Get.toNamed(LearnMoreScreen.id);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppTheme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
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
