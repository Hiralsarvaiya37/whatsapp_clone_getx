import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/Storage_and_data/view/manage_storage_screen.dart';
import 'package:whatsapp_clone_getx/setting/Storage_and_data/view/network_usage_screen.dart';
import 'package:whatsapp_clone_getx/setting/Storage_and_data/view/proxy_screen.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class StorageAndDataScreen extends StatelessWidget {
  StorageAndDataScreen({super.key});

  final SettingController storageController = Get.find();

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
          "Storage and data",
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
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageStorageScreen(),
                    ),
                  );
                },
                child: appTile(
                  "Manage storage",
                  "571.4 MB",
                  showIcon: true,
                  icon: Icons.folder_outlined,
                ),
              ),
              SizedBox(height: AppSize.getSize(35)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NetworkUsageScreen(),
                    ),
                  );
                },
                child: appTile(
                  "Network usage",
                  "75.8 MB sent. 630.0 MB received",
                  showIcon: true,
                  icon: Icons.data_saver_off,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  storageController.isOn.value = !storageController.isOn.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: AppSize.getSize(30)),
                        child: Text(
                          "Use less data for calls",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: storageController.isOn.value,
                        activeThumbColor: AppColors.blackColor,
                        activeTrackColor: AppColors.greenAccentShade700,
                        inactiveTrackColor: AppColors.blackColor,
                        onChanged: (val) {
                          storageController.isOn.value = val;
                        },
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
                    MaterialPageRoute(builder: (context) => ProxyScreen()),
                  );
                },
                child: appTile("Proxy", "Off"),
              ),
              SizedBox(height: AppSize.getSize(35)),
              appTile(
                "Media upload quality",
                "Standard quality",
                showIcon: true,
                icon: Icons.high_quality_outlined,
                onTap: () {
                  showRadioDialog(
                    context,
                    "Media upload quality",
                    "Select the quality for photos and videos to be sent at in chats.",
                    ["Standard quality", "HD quality"],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(30)),

              appTile(
                "Auto-download quality",
                "Choose...",
                onTap: () {
                  showRadioDialog(
                    context,
                    "Auto-download quality",
                    "Select the quality for photos and videos to be automatically downloaded in.",
                    ["Standard quality", "HD quality"],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Media auto-download",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              Text(
                "Voice messages are always automatically downloaded",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTile(
                "When using mobile data",
                "Photos",
                onTap: () {
                  showdialog(context, "When Using mobile data");
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              appTile(
                "When connected on Wi-Fi",
                "All media",
                onTap: () {
                  showdialog(context, "When connected on Wi-Fi");
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                "When roaming",
                "No media",
                onTap: () {
                  showdialog(context, "When roaming");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showdialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.greyShade900,
              title: Text(
                title,
                style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(28)),
              ),
              content: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dialogCheckItem(
                      "Photos",
                      storageController.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                      "Audio",
                      storageController.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                      "Videos",
                      storageController.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                      "Documents",
                      storageController.selectedItems,
                      setState,
                    ),

                    SizedBox(height: AppSize.getSize(25)),

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
                          onTap: () {
                            Navigator.pop(context);
                          },
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
              ),
            );
          },
        );
      },
    );
  }

  void showRadioDialog(
    BuildContext context,
    String title,
    String subtitle,
    List<String> options,
  ) {
    String selectedValue = options[0];

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AppColors.greyShade900,

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: AppColors.whiteColor)),
                  SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                ],
              ),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: options.map((option) {
                  bool isSelected = selectedValue == option;

                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = option;
                      });
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
                                color: isSelected
                                    ? AppColors.greenAccentShade700
                                    :AppColors.greyShade400,
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
                          SizedBox(width: AppSize.getSize(20)),
                          Expanded(
                            child: Text(
                              option,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: AppColors.greenAccentShade700,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: AppColors.greenAccentShade700,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget dialogCheckItem(
    String title,
    Map<String, bool> selectedItems,
    StateSetter setState,
  ) {
    return InkWell(
      onTap: () {
        selectedItems[title] = !(selectedItems[title] ?? false);
      },
      child: Row(
        children: [
          Checkbox(
            value: selectedItems[title],
            checkColor: AppColors.blackColor,
            activeColor: AppColors.greenAccentShade700,
            onChanged: (val) {
              selectedItems[title] = val ?? false;
            },
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appTile(
    String title,
    String subtitle, {
    bool showIcon = false,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showIcon && icon != null) ...[
            Icon(icon, size: 30, color: AppColors.greyShade400),
            SizedBox(width: AppSize.getSize(20)),
          ] else
            SizedBox(width: AppSize.getSize(50)),
          Column(
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
              Text(
                subtitle,
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
