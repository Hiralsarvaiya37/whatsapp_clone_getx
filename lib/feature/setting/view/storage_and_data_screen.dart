import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/manage_storage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/network_usage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/proxy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StorageAndDataScreen extends GetView<SettingController> {
  static const id ="/StorageAndDataScreen";
 const StorageAndDataScreen({super.key});


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
          context.l10n.storageanddata,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                 Get.toNamed(ManageStorageScreen.id);
                },
                child: appTile(
                  context.l10n.managestorage,
                  "571.4 MB",
                  showIcon: true,
                  icon: Icons.folder_outlined,
                ),
              ),
              SizedBox(height: AppSize.getSize(35)),
              InkWell(
                onTap: () {
                   Get.toNamed(NetworkUsageScreen.id);
                },
                child: appTile(
                  context.l10n.networkusage,
                  "75.8 MB sent. 630.0 MB received",
                  showIcon: true,
                  icon: Icons.data_saver_off,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  controller.isOn.value = !controller.isOn.value;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: AppSize.getSize(30)),
                        child: Text(
                          context.l10n.uselessdataforcalls,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.isOn.value,
                        activeThumbColor: AppTheme.blackColor,
                        activeTrackColor: AppTheme.greenAccentShade700,
                        inactiveTrackColor: AppTheme.blackColor,
                        onChanged: (val) {
                          controller.isOn.value = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                 Get.toNamed(ProxyScreen.id);
                },
                child: appTile(context.l10n.proxy, context.l10n.off),
              ),
              SizedBox(height: AppSize.getSize(35)),
              appTile(
                context.l10n.mediauploadquality,
                context.l10n.standardquality,
                showIcon: true,
                icon: Icons.high_quality_outlined,
                onTap: () {
                  showRadioDialog(
                    context,
                    context.l10n.mediauploadquality,
                    context.l10n.selectthequalityforphotosandvideostobesentatinchats,
                    [context.l10n.standardquality, context.l10n.hDquality],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(30)),

              appTile(
                context.l10n.autodownloadquality,
                context.l10n.choose,
                onTap: () {
                  showRadioDialog(
                    context,
                    context.l10n.autodownloadquality,
                    context.l10n.selectthequalityforphotosandvideostobeautomaticallydownloadedin,
                    [context.l10n.standardquality, context.l10n.hDquality],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.mediaautodownload,
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              Text(
                context.l10n.voicemessagesarealwaysautomaticallydownloaded,
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTile(
                context.l10n.whenusingmobiledata,
                context.l10n.photos,
                onTap: () {
                  showdialog(context, context.l10n.whenusingmobiledata);
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context.l10n.whenconnectedonWiFi,
                context.l10n.allmedia,
                onTap: () {
                  showdialog(context, context.l10n.whenconnectedonWiFi);
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context.l10n.whenroaming,
                context.l10n.nomedia,
                onTap: () {
                  showdialog(context, context.l10n.whenroaming);
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
              backgroundColor: AppTheme.greyShade900,
              title: Text(
                title,
                style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(28)),
              ),
              content: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dialogCheckItem(
                      context.l10n.photos,
                      controller.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                      context.l10n.audio,
                      controller.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                     context.l10n.video,
                      controller.selectedItems,
                      setState,
                    ),
                    dialogCheckItem(
                     context.l10n.documents,
                      controller.selectedItems,
                      setState,
                    ),

                    SizedBox(height: AppSize.getSize(25)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            context.l10n.cancel,
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
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
                            context.l10n.ok,
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
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
              backgroundColor: AppTheme.greyShade900,

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: AppTheme.whiteColor)),
                  SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
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
                                    ? AppTheme.greenAccentShade700
                                    :AppTheme.greyShade400,
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
                                        color: AppTheme.greenAccentShade700,
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
                                color: AppTheme.whiteColor,
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
                    context.l10n.cancel,
                    style: TextStyle(
                      color: AppTheme.greenAccentShade700,
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
                    context.l10n.save,
                    style: TextStyle(
                      color: AppTheme.greenAccentShade700,
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
            checkColor: AppTheme.blackColor,
            activeColor: AppTheme.greenAccentShade700,
            onChanged: (val) {
              selectedItems[title] = val ?? false;
            },
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
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
            Icon(icon, size: 30, color: AppTheme.greyShade400),
            SizedBox(width: AppSize.getSize(20)),
          ] else
            SizedBox(width: AppSize.getSize(50)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
