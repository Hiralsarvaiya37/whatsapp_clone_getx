import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class NotificationsScreen extends StatelessWidget {
   NotificationsScreen({super.key});
  final SettingController notificationController = Get.find();

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              radioTile(
                context,
                "Conversation tones",
                "Play sounds for incoming and outgoing messages.",
                index: 0,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                index: 1,
                "Reminders",
                "Get occasional reminders about messages, calls or status updates you haven't seen",
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Messages",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(15)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(()=> radioTile( context,"Notification tone", notificationController.selectedoption.value, showSwitch: false)),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
                ()=> radioTile(
                   context,
                  "Vibrate",
                  notificationController.selectedoption.value,
                  showSwitch: false,
                  isShow: true,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Popup notification",
                "Not available",
                showSwitch: false,
                titlecolor: AppColors.greyShade700,
                subtitlecolor: AppColors.greyShade700,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: AppColors.greyShade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(20),
                            vertical: AppSize.getSize(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Popup notifications are no longer available in your version of Android",
                                  style: TextStyle(
                                    color: AppColors.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(30)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Learn more",
                                        style: TextStyle(
                                          color: AppColors.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                          color: AppColors.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              Obx(()=> radioTile( context,"Light", notificationController.selectedoption1.value, showSwitch: false)),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Use high priority notifications",
                "Show previews of notifications at the top of the screen",
                index: 2,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Reactions notification",
                "Show notifications for reactions to messages you send",
                index: 3,
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Groups",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(15)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(()=> radioTile( context,"Notification tone", notificationController.selectedoption.value, showSwitch: false)),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
                ()=> radioTile(
                   context,
                  "Vibrate",
                  notificationController.selectedoption.value,
                  showSwitch: false,
                  isShow: false,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
                ()=> radioTile(
                   context,
                  "Light",
                  notificationController.selectedoption1.value,
                  showSwitch: false,
                  isShow: false,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Use high priority notifications",
                "Show Previews of notifications at the top of the screen",
                index: 4,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Reactions notifications",
                "Show notifications for reactions to messages you send",
                index: 5,
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Calls",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(15)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile( context,"Ringtone", "Default", showSwitch: false),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
               ()=> radioTile(
                 context,
                  "Vibrate",
                  notificationController.selectedoption.value,
                  showSwitch: false,
                  isShow: false,
                ),
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Status",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(15)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Obx(()=> radioTile( context,"Notification tone", notificationController.selectedoption.value, showSwitch: false)),
              SizedBox(height: AppSize.getSize(30)),
              Obx(
                ()=> radioTile(
                   context,
                  "Vibrate",
                  notificationController.selectedoption.value,
                  showSwitch: false,
                  isShow: false,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Use high priority notifications",
                "Show Previews of notifications at the top of the screen",
                index: 6,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                 context,
                "Reactions",
                "Show notifications when you get likes on a status",
                index: 7,
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Home screen notifications",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(15)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                 context,
                "Clear count",
                "Your home screen badge clears completely after every time you open the app.",
                index: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDailogBox(
    BuildContext context,
    String title,
    List<String> options,
    String selectedValue,
    Function(String) onSelected,
    bool isShow,
  ) {
    String tempSelected = selectedValue;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: AppColors.greyShade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: AppSize.getSize(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...options.map((item) {
                    return dialogRadio(item, tempSelected, setStateDialog, (
                      val,
                    ) {
                      setStateDialog(() {
                        tempSelected = item;
                      });
                      onSelected(item);
                    });
                  }),

                  if (isShow)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: AppColors.greenAccentShade700,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(30)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Ok",
                            style: TextStyle(
                              color: AppColors.greenAccentShade700,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                      ],
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget dialogRadio(
    String text,
    String selectedValue,
    Function setStateDialog,
    Function(String) onSelected,
  ) {
    bool isSelected = selectedValue == text;

    return InkWell(
      onTap: () {
        onSelected(text);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.getSize(12)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenAccentShade700,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: AppSize.getSize(15)),
            Text(text, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(16))),
          ],
        ),
      ),
    );
  }

  Widget radioTile(
    BuildContext context,
    String title,
    String subtitle, {
    int? index,
    bool showSwitch = true,
    bool isShow = true,
    Color? titlecolor,
    Color? subtitlecolor,
    VoidCallback? onTap,
    
  }) {
    return InkWell(
      onTap:
          onTap ??
          () {
            if (title == "Light") {
              showDailogBox(
                context,
                title,
                [
                  "None",
                  "White",
                  "Red",
                  "Yellow",
                  "Green",
                  "Cyan",
                  "Blue",
                  "Purple",
                ],
                notificationController.selectedoption1.value,
                (val) {
                    notificationController.selectedoption1.value = val;
                },
                isShow,
              );
            } else if (title == "Vibrate" || title == "Notification tone") {
              showDailogBox(
                context,
                title,
                ["Off", "Default", "Short", "Long"],
                notificationController.selectedoption.value,
                (val) {
                    notificationController.selectedoption.value = val;
                },
                isShow,
              );
            }
          },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titlecolor ?? AppColors.whiteColor,
                    fontSize: AppSize.getSize(17),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: subtitlecolor ?? AppColors.greyShade400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(10)),
          if (showSwitch && index != null)
            Obx(
            ()=> Switch(
                value: notificationController.isOn4[index],
                activeTrackColor: AppColors.greenAccentShade700,
                activeThumbColor: AppColors.blackColor,
                inactiveTrackColor: AppColors.blackColor,
                onChanged: (val) {
                    notificationController.isOn4[index] = val;
                },
              ),
            ),
        ],
      ),
    );
  }
}