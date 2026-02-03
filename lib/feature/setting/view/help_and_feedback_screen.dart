import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/app_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/channel_reports_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/help_center_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/send_feedback_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class HelpAndFeedbackScreen extends StatelessWidget {
  static const id = "/HelpAndFeedbackScreen";
  const HelpAndFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          context.l10n.help,
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
              child: appInfo(
                context.l10n.helpcenter,
                context.l10n.gethelpcontactus,context,
                Icons.help_outline_outlined,
                isShow: true,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SendFeedbackScreen()),
                );
              },
              child: appInfo(
                context.l10n.sendfeedback,
                context.l10n.reporttechnicalissues,context,
                Icons.bug_report_outlined,
                isShow: true,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              context.l10n.termsandprivacypolicy,
              "",context,
              Icons.description_outlined,
              isShow: false,
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChannelReportsScreen(),
                  ),
                );
              },
              child: appInfo(
                context.l10n.channelreports,
                "",context,
                Icons.feedback_outlined,
                isShow: false,
              ),
            ),
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppInfoScreen()),
                );
              },
              child: appInfo(
                context.l10n.appinfo,
                "",context,
                Icons.info_outline,
                isShow: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    BuildContext context,
    IconData icon, {
    bool isShow = true,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppSize.getSize(30), color: context.watch<AppTheme>().greyColor),
        SizedBox(width: AppSize.getSize(30)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: context.watch<AppTheme>().whiteColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isShow && subtitle.isNotEmpty)
              Text(
                subtitle,
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
