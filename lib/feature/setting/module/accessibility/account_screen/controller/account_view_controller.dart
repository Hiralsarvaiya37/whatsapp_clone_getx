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
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';

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
        backgroundColor: AppColors.greyShade900,
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
                      color: AppColors.greyShade400,
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
                    border: Border.all(color: AppColors.greyShade800),
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
                                  "Add new account",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                ),
                                Text(
                                  "+26587848545",
                                  style: TextStyle(
                                    color: AppColors.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: AppColors.greenAccentShade700,
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
                              color: AppColors.greyShade900,
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                              size: AppSize.getSize(28),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            "Add WhatsApp account",
                            style: TextStyle(
                              color: AppColors.whiteColor,
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
