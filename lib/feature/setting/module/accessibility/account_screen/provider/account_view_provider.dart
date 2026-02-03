// ignore_for_file: deprecated_member_use

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class AccountViewProvider extends ChangeNotifier {
  bool isNotificationOn = false;
  bool isNo = false;
  int selectedOption = (-1);
  List<String> options = [
    "The article is confusing",
    "The information is inaccurate",
    "I need a more detailed explanation",
    "This isn't the information I'm looking for",
    "Other",
  ];
  void setSelectedOption(int value) {
  selectedOption = value;
  notifyListeners(); 
}


   bool isOn = false;
  bool isYes = false;
  void toggleIsOn() {
    isOn = !isOn;
    notifyListeners();
  }
   void toggleisNotificationOn() {
    isNotificationOn = !isNotificationOn;
    notifyListeners();
  }


  void toggleIsYes() {
    isYes = !isYes;
    notifyListeners();
  }

  late VideoPlayerController videoController;
  bool isInitialized = false;
  bool isPlaying = false;
  Country? _selectedCountry;

  Country? get selectedCountry => _selectedCountry;

  set selectedCountry(Country? val) {
    _selectedCountry = val;
    notifyListeners();
  }
  AccountViewProvider() {
    initVideo();   
  }
  void initVideo() async {
    videoController = VideoPlayerController.network(
      'https://www.pexels.com/download/video/11836616/',
    );

    await videoController.initialize();
    isInitialized = true;
    notifyListeners();
  }

  void playPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying = false;
    } else {
      videoController.play();
      isPlaying = true;
    }
      notifyListeners();
  }

  void setYes() {
  isYes = true;
  isNo = false;
  notifyListeners();
}

void setNo() {
  isYes = false;
  isNo = true;
  notifyListeners();
}

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  void onTapAccountOption(AccountOptionsEnum value, BuildContext context) {
    if (value == AccountOptionsEnum.securityNotifications) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecurityNotificationsScreen()),
      );
    }
    if (value == AccountOptionsEnum.passKeys) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PassKeysScreen()),
      );
    }

    if (value == AccountOptionsEnum.emailAddress) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EmailAddressScreen()),
      );
    }
    if (value == AccountOptionsEnum.twoStepVerification) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TwoStepVerificationScreen()),
      );
    }

    if (value == AccountOptionsEnum.changeNumber) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChangeNumberScreen()),
      );
    }

    if (value == AccountOptionsEnum.requestAccountInfo) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RequestAccountInfoScreen()),
      );
    }

    if (value == AccountOptionsEnum.addAccount) {
         final theme = Provider.of<AppTheme>(context, listen: false);
      showModalBottomSheet(
        context: context,
        backgroundColor:theme.greyShade900,
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
                      color: theme.greyShade400,
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
                    border: Border.all(color: context.watch<AppTheme>().greyShade800),
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
                                    color: context.watch<AppTheme>().whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                ),
                                Text(
                                  "+26587848545",
                                  style: TextStyle(
                                    color: context.watch<AppTheme>().greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.check_circle,
                            color: theme.greenAccentShade700,
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
                              color: theme.greyShade900,
                            ),
                            child: Icon(
                              Icons.add,
                              color:theme.whiteColor,
                              size: AppSize.getSize(28),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            context.l10n.addWhatsAppaccount,
                            style: TextStyle(
                              color: theme.whiteColor,
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DeleteAccountScreen()),
      );
    }
  }
}
