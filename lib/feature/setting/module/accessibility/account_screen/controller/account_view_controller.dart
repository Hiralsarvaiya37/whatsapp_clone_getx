// ignore_for_file: deprecated_member_use

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/delete_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/email_address_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/request_account_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/security_notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/two_step_verification_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AccountViewController extends GetxController {
  RxBool isNotificationOn = false.obs;
  RxBool isYes = false.obs;
  RxBool isOn = false.obs;
  RxBool isNo = false.obs;
  RxInt selectedOption = (-1).obs;
  RxList<String> options = [
    "The article is confusing",
    "The information is inaccurate",
    "I need a more detailed explanation",
    "This isn't the information I'm looking for",
    "Other",
  ].obs;

  late VideoPlayerController videoController;
  RxBool isInitialized = false.obs;
  RxBool isPlaying = false.obs;
  Rx<Country?> selectedCountry = Rx<Country?>(null);

  @override
  void onInit() {
    super.onInit();
    initVideo();
  }

  void initVideo() async {
    videoController = VideoPlayerController.network(
      'https://www.pexels.com/download/video/11836616/',
    );

    await videoController.initialize();
    isInitialized.value = true;
  }

  void onTapAccountOption(AccountOptionsEnum value) {
    if (value == AccountOptionsEnum.securityNotifications) {
      Get.toNamed(SecurityNotificationsScreen.id);
    }
    if (value == AccountOptionsEnum.passkeys) {
      Get.toNamed(PassKeysScreen.id);
    }

    if (value == AccountOptionsEnum.emailAddress) {
    Get.toNamed(EmailAddressScreen.id);
    }
    if (value ==
        AccountOptionsEnum.twoStepVerification) {
      Get.toNamed(TwoStepVerificationScreen.id);
    }

    if (value == AccountOptionsEnum.changeNumber) {
     Get.toNamed(ChangeNumberScreen.id);
    }

    if (value ==
        AccountOptionsEnum.requestAccountInfo) {
    Get.toNamed(RequestAccountInfoScreen.id);
    }

    if (value == AccountOptionsEnum.addAccount) {
      showModalBottomSheet(
        context: Get.context!,
        backgroundColor: AppTheme.greyShade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppSize.getSize(20)),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(AppSize.getSize(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: AppSize.getSize(3),
                    width: AppSize.getSize(40),
                    decoration: BoxDecoration(
                      color: AppTheme.greyShade400,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.getSize(20)),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.getSize(20),
                    vertical: AppSize.getSize(20),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.greyShade800),
                    borderRadius: BorderRadius.circular(AppSize.getSize(15)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                              height: AppSize.getSize(50),
                              width: AppSize.getSize(50),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(15)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.l10n.addnewaccount,
                                  style: TextStyle(
                                    color: AppTheme.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                ),
                                Text(
                                  "+26587848545",
                                  style: TextStyle(
                                    color: AppTheme.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: AppTheme.greenAccentShade700,
                            size: AppSize.getSize(25),
                          ),
                        ],
                      ),

                      SizedBox(height: AppSize.getSize(20)),

                      Row(
                        children: [
                          Container(
                            height: AppSize.getSize(50),
                            width: AppSize.getSize(50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.getSize(50),
                              ),
                              color: AppTheme.greyShade900,
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppTheme.whiteColor,
                              size: AppSize.getSize(28),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            context.l10n.addWhatsAppaccount,
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    if (value == AccountOptionsEnum.deleteAccount) {
     Get.toNamed(DeleteAccountScreen.id);
    }
  }

  void playPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
