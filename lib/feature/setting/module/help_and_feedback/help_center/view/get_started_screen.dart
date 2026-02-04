import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/download_and_installation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/help_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/linked_devices_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/registration_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/status_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';
class GetStartedScreen extends StatelessWidget {
  static const id = "/GetStartedScreen";
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor:theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color:theme.whiteColor),
        ),
        title: Text(
          "Help Center",
          style: TextStyle(
            color:theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.search, size: AppSize.getSize(25), color: theme.whiteColor),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, size: AppSize.getSize(25), color:theme.whiteColor),
            color: theme.greyShade900,
            offset: Offset(0, 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: theme.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started",
                  style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DownloadAndInstallationScreen()));
                  },
                  child: appInfo("Download and installation", Icons.download,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                  },
                  child: appInfo("Registration", Icons.person_2,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LinkedDevicesScreen()));
                  },
                  child: appInfo("Linked Devices", Icons.devices,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>TroubleshootingScreen()));
                  },
                  child: appInfo("Troubleshooting", Icons.help,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpContactsScreen()));
                  },
                  child: appInfo("Contacts", Icons.perm_contact_cal_rounded,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusScreen()));
                  },
                  child: appInfo("Status", Icons.data_saver_on_rounded,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
              ],
            ),
          ),
        CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon, BuildContext context) {
      final theme = Provider.of<AppTheme>(context, listen: false);
    return Row(
      children: [
        Icon(icon, size: AppSize.getSize(25), color: theme.greenAccentShade700),
        SizedBox(width: AppSize.getSize(25)),
        Text(
          title,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
