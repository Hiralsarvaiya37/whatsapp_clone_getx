import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyScreen1 extends StatelessWidget {
  static const id = "/PrivacyScreen1";
  const PrivacyScreen1({super.key});

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
          context.l10n.privacy,
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
            offset:  Offset(0, 45),
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
                    context.l10n.privacy,
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(context.l10n.aboutendtoendencryption, context),
                  appInfo(context.l10n.aboutprivacycheckup, context),
                  appInfo(context.l10n.howtochangeyourprivacysettings, context),
                  appInfo(context.l10n.howtochangegroupprivacysettings, context),
                  appInfo(
                    context.l10n.howtoprotectyourIPaddressonWhatsAppcalls,
                    context,
                  ),
                  appInfo(context.l10n.doesWhatsAppcollectorsellyourdata, context),
                  appInfo(context.l10n.aboutadvancedchatprivacy, context),
                  appInfo(
                    context.l10n.privacyataGlanceAdditionalinformationabouttheupdatesTab,
                    context,
                  ),
                  appInfo(context.l10n.howtosilenceunknowncallers, context),
                  appInfo(context.l10n.aboutlastseenandonline, context),
                  appInfo(context.l10n.aboutWhatsApppermissions, context),
                  appInfo(context.l10n.howtouseapplock, context),
                  appInfo(context.l10n.aboutsharingyourdeviceslocation, context),
                  appInfo(
                    context.l10n.whatistraceabilityandwhydoesWhatsAppopposeit,
                    context,
                  ),
                  appInfo(context.l10n.aboutDITWhatsAPpNet, context),
                  appInfo(
                    context.l10n.aboutusingoptionalMetaCompanyProductsifyouoptedoutofsharingWhatsAppaccountinformationwithMeta,
                    context,
                  ),
                  appInfo(
                    context.l10n.whyamiseeinganewsystemmessageinmyWhatsAppchats,
                    context,
                  ),
                  appInfo(
                    context.l10n.explainingAppleandAndroidAppPrivacyReports,
                    context,
                  ),
                  appInfo(
                    context.l10n.unpackingWhatsAppsprivacylabelintheAppleAppStore,
                    context,
                  ),
                  appInfo(context.l10n.aboutgovermentrequestsforuserdata, context),
                  appInfo(context.l10n.yearlyreminderforusersinindia, context),
                  appInfo(
                    context.l10n.aboutmandatorydisclosurestobemadebyBusinessesinindia,
                    context,
                  ),
                  appInfo(
                    context.l10n.learnaboutwhatcategoriesofdataareavailableinyourRequestAccountinforeport,
                    context,
                  ),
                  appInfo(
                    context.l10n.whatinformationdoesWhatsAppcollectwhenyoucontactsupport,
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
