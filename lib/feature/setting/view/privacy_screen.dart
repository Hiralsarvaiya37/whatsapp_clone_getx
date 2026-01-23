import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_controller.dart';
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

class PrivacyScreen extends GetView<PrivacyViewController> {
  static const id ="/PrivacyScreen";
const   PrivacyScreen({super.key});


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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          context.l10n.privacy,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.whocanseemypersonalinfo,
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
                SizedBox(height: AppSize.getSize(15)),
                appTitle(
                  context.l10n.lastseenandonline,
                  context.l10n.nobody,
                  onTap: () {
                   Get.toNamed(LastseenAndOnlineScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.profilepicture,
                  context.l10n.mycontacts,
                  onTap: () {
                    Get.toNamed(ProfilePhotoScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.about,
                  context.l10n.everyone,
                  onTap: () {
                    Get.toNamed(AboutScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.links,
                  context.l10n.mycontacts,
                  onTap: () {
                    Get.toNamed(LinksScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.status,
                  context.l10n.mycontacts,
                  onTap: () {
                    Get.toNamed(StatusPrivacyScreen.id);
                  },
                ),
            
                SizedBox(height: AppSize.getSize(20)),
            
                InkWell(
                  onTap: () {
                    controller.settingController .isOn.value = !controller.settingController.isOn.value;
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.l10n.readreceipts,
                          style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                        ),
                      ),
                      Obx(
                       ()=> Switch(
                          value: controller.settingController.isOn.value,
                          activeThumbColor: AppTheme.blackColor,
                          activeTrackColor: AppTheme.greenAccentShade700,
                          inactiveTrackColor: AppTheme.blackColor,
                          onChanged: (val) {
                            controller.settingController.isOn.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  context.l10n.ifturnedoffyouwontsendorreceiveReadreceiptsReadreceiptsarealwayssentforgroupchats,
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                Text(
                  context.l10n.disappearingmessages,
                  style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
            
                SizedBox(height: AppSize.getSize(15)),
                InkWell(
                  onTap: () {
                    Get.toNamed(DefaultMessageTimerScreen.id);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.defaultmessagetimer,
                              style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text(
                              context.l10n.startnewchatswithdisappearingmessagessettoyourtimer,
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        context.l10n.off,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(40)),
            
                appTitle(
                  context.l10n.groups,
                 context.l10n.mycontacts,
                  onTap: () {
                    Get.toNamed(GroupsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.avatarstickers,
                  context.l10n.mycontacts,
                  onTap: () {
                    Get.toNamed(AvatarStickersScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                   Get.toNamed(LiveLocationScreen.id);
                  },
                  child: Text(
                    context.l10n.livelocation,
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.calls,
                  context.l10n.silenceunknowncallers,
                  onTap: () {
                    Get.toNamed(CallsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                 context.l10n.contacts,
                  context.l10n.blockcontactsWhatsAppcontacts,
                  onTap: () {
                    Get.toNamed(PrivacyContactsScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                appTitle(
                  context.l10n.applock,
                  context.l10n.disabled,
                  onTap: () {
                   Get.toNamed(AppLockScreen.id);
                  },
                ),
                SizedBox(height: AppSize.getSize(20)),
                InkWell(
                  onTap: () {
                    Get.toNamed(ChatLockScreen.id);
                  },
                  child: Text(
                    context.l10n.chatlock,
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    controller.settingController.isYes.value =
                        !controller.settingController.isYes.value;
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
                              style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        context.l10n.useeffectsinthecameraandvideocalls,
                                    style: TextStyle(
                                      color: AppTheme.greyShade400,
                                      fontSize: AppSize.getSize(16),
                                    ),
                                  ),
                                  TextSpan(
                                    text: context.l10n.learnmore,
                                    style: TextStyle(
                                      color: AppTheme.blueshade500,
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
                      Obx(
                       ()=> Switch(
                          value: controller.settingController.isYes.value,
                          activeThumbColor: AppTheme.blackColor,
                          activeTrackColor: AppTheme.greenAccentShade700,
                          inactiveTrackColor: AppTheme.blackColor,
                          onChanged: (val) {
                            controller.settingController.isYes.value = val;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(AdvancedScreen.id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.advanced,
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        context.l10n.protectIPaddressincallsDisablelinkpreviews,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Get.toNamed(PrivacyCheckupScreen.id);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.privacycheckup,
                        style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18)),
                      ),
                      Text(
                        context.l10n.controlyourprivacyandchoosetherightsettingsforyou,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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

  Widget appTitle(String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(18))),
          Text(
            subtitle,
            style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
          ),
        ],
      ),
    );
  }
}
