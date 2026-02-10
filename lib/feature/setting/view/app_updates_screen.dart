import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AppUpdatesScreen extends StatelessWidget {
  static const id = "/AppUpdatesScreen";
  const AppUpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppTheme.whiteColor,
          appBar: AppBar(
            backgroundColor: AppTheme.whiteColor,
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
                  state.isShow1,
                  (val) {
                    context.read<SettingBloc>().add(ToggleAppUpdateOption(1, val));
                  },
                ),

                SizedBox(height: AppSize.getSize(25)),
                appInfo(
                  "Allow updates over any network",
                  "Download updates using mobile data when Wi-Fi is not available. Data charges may apply.",
                  state.isShow2,
                  (val) {
                    context.read<SettingBloc>().add(ToggleAppUpdateOption(2, val));
                  },
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
                  state.isShow3,
                  (val) {
                     context.read<SettingBloc>().add(ToggleAppUpdateOption(3, val));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
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
                    color: AppTheme.greyShade800,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            activeThumbColor: AppTheme.blueshade900,
            activeTrackColor: AppTheme.blueshade100,
            inactiveTrackColor: AppTheme.greyShade400,
            inactiveThumbColor: AppTheme.whiteColor,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
