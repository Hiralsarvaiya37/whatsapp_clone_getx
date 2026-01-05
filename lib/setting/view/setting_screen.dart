import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:language_info_plus/language_info_plus.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/setting/view/accessibility_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/account_setting_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/avatar_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/broadcasts_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/chats_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/help_and_feedback_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/lists_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/notifications_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/privacy_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/qr_screen.dart';
import 'package:whatsapp_clone_getx/setting/view/storage_and_data_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/setting_option_enum.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  final SettingController langController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.whiteColor,
            size: AppSize.getSize(25),
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: AppSize.getSize(25),
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: AppColors.whiteColor,
            size: AppSize.getSize(25),
          ),
          SizedBox(width: AppSize.getSize(20)),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.astroyogi.com/strapicmsprod/assets/peacock_feather_astrological_remedies_728x409_1_df32d89b61_5e65b3c4bb.webp",
                      height: AppSize.getSize(50),
                      width: AppSize.getSize(50),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: AppSize.getSize(20)),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User account",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(25),
                            vertical: AppSize.getSize(2),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.greyShade400),
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(20),
                            ),
                          ),
                          child: Text(
                            "Busy",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QrScreen()),
                      );
                    },
                    child: Icon(
                      Icons.qr_code,
                      color: AppColors.greenAccentShade700,
                      size: AppSize.getSize(28),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      openAddAccountSheet(context);
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: AppColors.greenAccentShade700,
                      size: AppSize.getSize(28),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(30)),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: SettingOptionEnum.values.length,
                itemBuilder: (context, index) {
                  final item = SettingOptionEnum.values[index];
                  return ListTile(
                    leading: Icon(
                      item.iconData,
                      color: AppColors.whiteColor,
                      size: AppSize.getSize(28),
                    ),

                    title: Text(
                      item.titles,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                    subtitle: (item.subtitles.isNotEmpty)
                        ? Text(
                            item.subtitles,
                            style: TextStyle(
                              color: AppColors.greyColor,
                              fontSize: AppSize.getSize(16),
                            ),
                          )
                        : null,

                    onTap: () {
                      if (item.titles == "Account") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountSettingScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Privacy") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Avatar") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvatarScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Lists") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListsScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Chat") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatsScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Broadcasts") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BroadcastsScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Notifications") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationsScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Storage and data") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StorageAndDataScreen(),
                          ),
                        );
                      }

                      if (item.titles == "Accessibility") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccessibilityScreen(),
                          ),
                        );
                      }

                      if (item.titles == "App language") {
                        openModalSheet(context);
                      }

                      if (item.titles == "Help and feedback") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HelpAndFeedbackScreen(),
                          ),
                        );
                      }
                      if (item.titles == "Invite a friend") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => InviteFriendScreen(),
                        //   ),
                        // );
                      }
                      if (item.titles == "App updates") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AppUpdatesScreen(),
                        //   ),
                        // );
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.getSize(18)),
              ),

              SizedBox(height: AppSize.getSize(20)),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(10),
                  vertical: AppSize.getSize(20),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppColors.greyShade800,
                      width: AppSize.getSize(1),
                    ),
                    bottom: BorderSide(
                      color: AppColors.greyShade800,
                      width: AppSize.getSize(1),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.all_inclusive,
                          size: AppSize.getSize(25),
                          color: AppColors.whiteColor,
                        ),
                        SizedBox(width: AppSize.getSize(10)),
                        Text(
                          "Meta",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSize.getSize(5)),
                    Text(
                      "Accounts Center",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(17),
                      ),
                    ),

                    SizedBox(height: AppSize.getSize(5)),
                    Text(
                      "Control your experience across WhatsApp, Facebook, Instagram and more.",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.getSize(20)),

              Text(
                "Also from Meta",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(17),
                ),
              ),

              SizedBox(height: AppSize.getSize(25)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appIcon("Meta AI App", Icons.circle_outlined),
                  appIcon("Instagram", Icons.photo_camera),
                  appIcon("Facebook", Icons.facebook),
                  appIcon("Threads", Icons.alternate_email_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appIcon(String label, IconData icon) {
    return Column(
      children: [
        Container(
          height: AppSize.getSize(50),
          width: AppSize.getSize(50),
          decoration: BoxDecoration(
            color: AppColors.greyShade900,
            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
          ),
          child: Icon(
            icon,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        SizedBox(height: AppSize.getSize(7)),
        Text(
          label,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(16),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void openAddAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(AppSize.getSize(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: AppSize.getSize(4),
                  width: AppSize.getSize(40),
                  decoration: BoxDecoration(
                    color: AppColors.greyShade400,
                    borderRadius: BorderRadius.circular(AppSize.getSize(20)),
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
                            "https://madaboutdecor.co.in/cdn/shop/files/IMG_0713.heic?v=1728289287",
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

                    SizedBox(height: AppSize.getSize(15)),

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
                        SizedBox(width: AppSize.getSize(15)),
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

  void openModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.greyShade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.getSize(20)),
        ),
      ),
      builder: (modalContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height:
                  MediaQuery.of(context).size.height * AppSize.getSize(0.97),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(25),
                vertical: AppSize.getSize(7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: AppSize.getSize(5),
                      width: AppSize.getSize(40),
                      decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(20),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.getSize(20)),

                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: AppSize.getSize(25),
                          color: AppColors.greyShade400,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(25)),
                      Text(
                        "App language",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppSize.getSize(20),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: langController.allLanguages.length,
                        itemBuilder: (context, index) {
                          final lang = langController.allLanguages[index];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: AppSize.getSize(20),
                            ),
                            child: radioTile(lang, setModalState, modalContext),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget radioTile(
    Language lang,
    void Function(VoidCallback) setModalState,
    BuildContext context,
  ) {
    return Obx(() {
      bool isSelected =
          langController.selectedLanguage.value?.code == lang.code;

      String title = lang.name;
      String? subtitle;

      if (lang.name.contains('(')) {
        final parts = lang.name.split('(');
        title = parts.first.trim();
        subtitle = '(${parts.last}';
      }

      return InkWell(
        onTap: () {
          setModalState(() {
            langController.selectedLanguage.value = lang;
          });
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.getSize(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: AppSize.getSize(22),
                width: AppSize.getSize(22),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? AppColors.greenAccentShade700
                        : AppColors.greyColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          height: AppSize.getSize(12),
                          width: AppSize.getSize(12),
                          decoration: BoxDecoration(
                            color: AppColors.greenAccentShade700,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : SizedBox(),
              ),

              SizedBox(width: AppSize.getSize(25)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    if (subtitle != null)
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(15),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
