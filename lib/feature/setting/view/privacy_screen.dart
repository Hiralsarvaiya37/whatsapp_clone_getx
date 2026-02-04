import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/about_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/avatar_stickers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/chat_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/links_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/live_location_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_checkup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/profile_photo_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/status_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyScreen extends StatelessWidget {
  static const id = "/PrivacyScreen";
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    final provider = context.watch<PrivacyViewProvider>();
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
          context.l10n.privacy,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.whocanseemypersonalinfo,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),
              appTitle(context,
                context.l10n.lastseenandonline,
                context.l10n.nobody,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LastseenAndOnlineScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.profilepicture,
                context.l10n.mycontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePhotoScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.about,
                context.l10n.everyone,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.links,
                context.l10n.mycontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LinksScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.status,
                context.l10n.mycontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StatusPrivacyScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(20)),

              InkWell(
                onTap: () {
                  provider.settingController.isOn =
                      !provider.settingController.isOn;
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.readreceipts,
                        style: TextStyle(
                          color: theme.whiteColor,
                          fontSize: AppSize.getSize(18),
                        ),
                      ),
                    ),
                    Switch(
                      value: provider.isOn,
                      activeThumbColor: theme.blackColor,
                      activeTrackColor: theme.greenAccentShade700,
                      inactiveTrackColor: theme.blackColor,
                      onChanged: (val) {
                        provider.isOn = val;
                      },
                    ),
                  ],
                ),
              ),
              Text(
                context
                    .l10n
                    .ifturnedoffyouwontsendorreceiveReadreceiptsReadreceiptsarealwayssentforgroupchats,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),

              SizedBox(height: AppSize.getSize(30)),
              Text(
                context.l10n.disappearingmessages,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),

              SizedBox(height: AppSize.getSize(15)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefaultMessageTimerScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.defaultmessagetimer,
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          Text(
                            context
                                .l10n
                                .startnewchatswithdisappearingmessagessettoyourtimer,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      context.l10n.off,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(40)),

              appTitle(context,
                context.l10n.groups,
                context.l10n.mycontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupsScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(
                context,
                context.l10n.avatarstickers,
                context.l10n.mycontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AvatarStickersScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveLocationScreen(),
                    ),
                  );
                },
                child: Text(
                  context.l10n.livelocation,
                  style: TextStyle(
                    color: theme.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.calls,
                context.l10n.silenceunknowncallers,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CallsScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.contacts,
                context.l10n.blockcontactsWhatsAppcontacts,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyContactsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTitle(context,
                context.l10n.applock,
                context.l10n.disabled,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppLockScreen()),
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatLockScreen()),
                  );
                },
                child: Text(
                  context.l10n.chatlock,
                  style: TextStyle(
                    color: theme.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  provider.isYes = !provider.isYes;
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.allowcameraeffects,
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: context
                                      .l10n
                                      .useeffectsinthecameraandvideocalls,
                                  style: TextStyle(
                                    color: theme.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                                TextSpan(
                                  text: context.l10n.learnmore,
                                  style: TextStyle(
                                    color: theme.blueshade500,
                                    fontSize: AppSize.getSize(16),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: provider.isYes,
                      activeThumbColor: theme.blackColor,
                      activeTrackColor: theme.greenAccentShade700,
                      inactiveTrackColor: theme.blackColor,
                      onChanged: (val) {
                        provider.isYes = val;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvancedScreen()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.advanced,
                      style: TextStyle(
                        color: theme.whiteColor,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                    Text(
                      context.l10n.protectIPaddressincallsDisablelinkpreviews,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyCheckupScreen(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.privacycheckup,
                      style: TextStyle(
                        color: theme.whiteColor,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                    Text(
                      context
                          .l10n
                          .controlyourprivacyandchoosetherightsettingsforyou,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget appTitle(BuildContext context,String title, String subtitle, {VoidCallback? onTap}) {
 final theme = Provider.of<AppTheme>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: theme.whiteColor,
              fontSize: AppSize.getSize(18),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: theme.greyShade400,
              fontSize: AppSize.getSize(16),
            ),
          ),
        ],
      ),
    );
  }
}
