import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class RequestAccountInfoScreen extends StatelessWidget {
  static const id = "/RequestAccountInfoScreen";
  const RequestAccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = context.watch<AccountViewProvider>();
    final theme = context.watch<AppTheme>();

    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.requestaccountinfo,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          children: [
            requestTile(
              title: context.l10n.accountinformation,
              value: accountProvider.isOn,
              onChanged: (_) => accountProvider.toggleIsOn(),
              context: context,
            ),
            SizedBox(height: AppSize.getSize(30)),
            requestTile(
              title: context.l10n.channelsactivity,
              value: accountProvider.isYes,
              onChanged: (_) => accountProvider.toggleIsYes(),
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget requestTile({
    required String title,
    required bool value,
    required void Function(bool) onChanged,
    required BuildContext context,
  }) {
    final theme = context.watch<AppTheme>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSize.getSize(25)),
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: AppSize.getSize(30),
              color: theme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.requestsent,
                  style: TextStyle(
                    color: theme.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
                Text(
                  context.l10n.readybyDecember7_2025,
                  style: TextStyle(
                    color: theme.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSize.getSize(20)),
        Text(
          context.l10n.yourreportwillbereadyinabout3daysYoullhaveafewweekstodownloadyourreportafteritsavailable,
          style: TextStyle(
            color: theme.greyShade400,
            fontSize: AppSize.getSize(16),
          ),
        ),
        SizedBox(height: AppSize.getSize(20)),
        Row(
          children: [
            Icon(
              Icons.replay_rounded,
              size: AppSize.getSize(30),
              color: theme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(8)),
            Expanded(
              child: Text(
                context.l10n.createreportsautomatically,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(17),
                ),
              ),
            ),
            Switch(
              value: value,
              activeThumbColor: theme.blackColor,
              activeTrackColor: theme.greenAccentShade700,
              inactiveTrackColor: theme.blackColor,
              onChanged: onChanged,
            ),
          ],
        ),
        SizedBox(height: AppSize.getSize(15)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: context.l10n.anewreportwillbecreatedeverymonth,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              TextSpan(
                text: context.l10n.learnmore,
                style: TextStyle(
                  color: theme.blueshade500,
                  fontSize: AppSize.getSize(16),
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LearnMoreScreen(),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
