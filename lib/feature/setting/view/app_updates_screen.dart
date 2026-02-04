import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AppUpdatesScreen extends StatelessWidget {
  static const id = "/AppUpdatesScreen";
  const AppUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    final provider = context.watch<SettingProvider>();
    return Scaffold(
      backgroundColor: theme.whiteColor,
      appBar: AppBar(
        backgroundColor: theme.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25)),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: AppSize.getSize(30)),
          child: Text(
            "App update settings",
            style: TextStyle(
              fontSize: AppSize.getSize(20),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "App updates",
              style: TextStyle(
                fontSize: AppSize.getSize(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Auto-update WhatsApp",
              "Automatically download app updates.",
              provider.isShow1,
              (val) {
                provider.isShow1 = val;
              },context
            ),
            SizedBox(height: AppSize.getSize(25)),
            appInfo(
              "Allow updates over any network",
              "Download updates using mobile data when Wi-Fi is not available. Data charges may apply.",
              provider.isShow2,
              (val) {
                provider.isShow2 = val;
              },context
            ),

            SizedBox(height: AppSize.getSize(35)),
            Text(
              "Notifications",
              style: TextStyle(
                fontSize: AppSize.getSize(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSize.getSize(25)),
            appInfo(
              "WhatsApp update available",
              "Get notified when updates are available.",
              provider.isShow3,
              (val) {
                provider.isShow3 = val;
              },context
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    BuildContext context
  ) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return InkWell(
      onTap: () {
        onChanged(!value);
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
                    fontSize: AppSize.getSize(18),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: AppSize.getSize(16),
                    color: theme.greyShade800,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: theme.blueshade900,
            activeTrackColor: theme.blueshade100,
            inactiveTrackColor: theme.greyShade400,
            inactiveThumbColor: theme.whiteColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
