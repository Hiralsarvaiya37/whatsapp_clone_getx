import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SafetyScreen extends StatelessWidget {
  static const id = "/SafetyScreen";
  const SafetyScreen({super.key});

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
          context.l10n.safety,
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
            offset: Offset(0, AppSize.getSize(45)),
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
                    context.l10n.safety,
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo(context.l10n.howtoblockandreportsomeone, context),
                  appInfo(context.l10n.aboutreportingandblockingonWhatsApp, context),
                  appInfo(context.l10n.howtoblockagroupadmin, context),
                  appInfo(context.l10n.beingblockedbysomeone, context),
                  appInfo(context.l10n.howtoreportsomeonesstatusupdate, context),
                  appInfo(context.l10n.aboutsuspiciousmessagesandscams, context),
                  appInfo(
                    context.l10n.howtoprotectyourselffromsuspiciousmessagesandscams,
                    context,
                  ),
                  appInfo(context.l10n.howtouseWhatsAppresponsibly, context),
                  appInfo(
                    context.l10n.tipstokeepyourWhatsAppaccountsafeandsecure,
                    context,
                  ),
                  appInfo(
                    context.l10n.howsafesecureisWhatsAppPrivacyexplained,
                    context,
                  ),
                  appInfo(context.l10n.howtostaysafeonWhatsApp, context),
                  appInfo(context.l10n.howtostaysafeingroupsonWhatsApp, context),
                  appInfo(
                    context.l10n.howtoblockhighvolumesofunknownmessages,
                    context,
                  ),
                  appInfo(context.l10n.aboutunofficialapps, context),
                  appInfo(context.l10n.aboutsuspiciouslinks, context),
                  appInfo(context.l10n.aboutsuspiciousfiles, context),
                  appInfo(context.l10n.abouttheofficialWhatsAppchataccount, context),
                  appInfo(
                    context.l10n.abouttheofficialWhatsAppBusinessaccount,
                    context,
                  ),
                  appInfo(
                    context.l10n.aboutsafelycommunicatingwithWhatsAppSupport,
                    context,
                  ),
                  appInfo(context.l10n.aboutharvestingpersonalinformation, context),
                  appInfo(
                    context.l10n.iFCNfactcheckingorganizationsonWhatsApp,
                    context,
                  ),
                  appInfo(
                    context.l10n.howtopreventthespreadofmisinformation,
                    context,
                  ),
                  appInfo(context.l10n.aboutminimumagetouseWhatsApp, context),
                  appInfo(context.l10n.howtoprotectyouraccountfrommalware, context),
                  appInfo(context.l10n.aboutWhatsAPpandelections, context),
                  appInfo(
                    context.l10n.unauthorizeduseofautomatedorbulkmessagingonWhatsApp,
                    context,
                  ),
                  appInfo(
                    context.l10n.howWhatsAppHelpsFightChildExploitation,
                    context,
                  ),
                  appInfo(context.l10n.ensuringusersafetyinindiaonWhatsApp, context),
                  appInfo(context.l10n.keepingWhatsAppUserssafeinindonesia, context),
                  appInfo(context.l10n.aboutdetectingviolations, context),
                  appInfo(context.l10n.globalSuicidehotlineResources, context),
                  appInfo(
                    context.l10n.informationforLawEnforcementAuthorities,
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
