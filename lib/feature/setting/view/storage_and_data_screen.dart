import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/manage_storage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/network_usage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/proxy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StorageAndDataScreen extends StatelessWidget {
  static const id = "/StorageAndDataScreen";
  const StorageAndDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SettingProvider>();
     final theme = Provider.of<AppTheme>(context, listen: false);
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
          context.l10n.storageanddata,
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
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageStorageScreen()));
                },
                child: appTile(context,
                  context.l10n.managestorage,
                  "571.4 MB",
                  showIcon: true,
                  icon: Icons.folder_outlined,
                ),
              ),
              SizedBox(height: AppSize.getSize(35)),
              InkWell(
                onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>NetworkUsageScreen()));
                },
                child: appTile(context,
                  context.l10n.networkusage,
                  "75.8 MB sent. 630.0 MB received",
                  showIcon: true,
                  icon: Icons.data_saver_off,
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  provider.isOn = !provider.isOn;
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
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
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
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProxyScreen()));
                },
                child: appTile(context,context.l10n.proxy, context.l10n.off),
              ),
              SizedBox(height: AppSize.getSize(35)),
              appTile(context,
                context.l10n.mediauploadquality,
                context.l10n.standardquality,
                showIcon: true,
                icon: Icons.high_quality_outlined,
                onTap: () {
                  showRadioDialog(
                    context,
                    context.l10n.mediauploadquality,
                    context
                        .l10n
                        .selectthequalityforphotosandvideostobesentatinchats,
                    [context.l10n.standardquality, context.l10n.hDquality],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(30)),

              appTile(context,
                context.l10n.autodownloadquality,
                context.l10n.choose,
                onTap: () {
                  showRadioDialog(
                    context,
                    context.l10n.autodownloadquality,
                    context
                        .l10n
                        .selectthequalityforphotosandvideostobeautomaticallydownloadedin,
                    [context.l10n.standardquality, context.l10n.hDquality],
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.mediaautodownload,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              Text(
                context.l10n.voicemessagesarealwaysautomaticallydownloaded,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              appTile(context,
                context.l10n.whenusingmobiledata,
                context.l10n.photos,
                onTap: () {
                  showDialogItems(context, context.l10n.whenusingmobiledata);
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              appTile(context,
                context.l10n.whenconnectedonWiFi,
                context.l10n.allmedia,
                onTap: () {
                  showDialogItems(context, context.l10n.whenconnectedonWiFi);
                },
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(context,
                context.l10n.whenroaming,
                context.l10n.nomedia,
                onTap: () {
                  showDialogItems(context, context.l10n.whenroaming);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDialogItems(BuildContext context, String title) {
    final provider = context.read<SettingProvider>();
 final theme = Provider.of<AppTheme>(context, listen: false);
    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: theme.greyShade900,
              title: Text(
                title,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(28),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  dialogCheckItem(context,
                    context.l10n.photos,
                    provider.selectedItems,
                    setState,
                  ),
                  dialogCheckItem(context,
                    context.l10n.audio,
                    provider.selectedItems,
                    setState,
                  ),
                  dialogCheckItem(context,
                    context.l10n.video,
                    provider.selectedItems,
                    setState,
                  ),
                  dialogCheckItem(context,
                    context.l10n.documents,
                    provider.selectedItems,
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
                            color: theme.greenAccentShade700,
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
                            color: theme.greenAccentShade700,
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

  void showRadioDialog(
    BuildContext context,
    String title,
    String subtitle,
    List<String> options,
  ) {
    String selectedValue = options[0];
 final theme = Provider.of<AppTheme>(context, listen: false);
    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: theme.greyShade900,

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: theme.whiteColor)),
                  SizedBox(height: 10),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
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
                      padding: EdgeInsets.symmetric(
                        vertical: AppSize.getSize(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: AppSize.getSize(22),
                            width: AppSize.getSize(22),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? theme.greenAccentShade700
                                    : theme.greyShade400,
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
                                        color: theme.greenAccentShade700,
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
                                color: theme.whiteColor,
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
                      color: theme.greenAccentShade700,
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
                      color: theme.greenAccentShade700,
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
  BuildContext context,
  String title,
  Map<String, bool> selectedItems,
  StateSetter setState,
) {
   final theme = Provider.of<AppTheme>(context, listen: false);
  return InkWell(
    onTap: () {
      setState(() {
        selectedItems[title] = !(selectedItems[title] ?? false);
      });
    },
    child: Row(
      children: [
        Checkbox(
          value: selectedItems[title] ?? false,
          checkColor: theme.blackColor,
          activeColor: theme.greenAccentShade700,
          onChanged: (val) {
            setState(() {
              selectedItems[title] = val ?? false;
            });
          },
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: theme.whiteColor,
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
    BuildContext context,
    String title,
    String subtitle, {
    bool showIcon = false,
    IconData? icon,
    VoidCallback? onTap,
  }) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (showIcon && icon != null) ...[
            Icon(icon, size: 30, color: theme.greyShade400),
            SizedBox(width: AppSize.getSize(20)),
          ] else
            SizedBox(width: AppSize.getSize(50)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(18),
                  fontWeight: FontWeight.w600,
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
        ],
      ),
    );
  }
}
