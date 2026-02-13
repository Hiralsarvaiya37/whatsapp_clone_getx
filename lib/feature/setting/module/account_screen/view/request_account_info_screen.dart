import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class RequestAccountInfoScreen extends StatelessWidget {
  static const id = "/RequestAccountInfoScreen";
  const RequestAccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.requestaccountinfo,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
            BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                return requestTile(
                  title: context.l10n.accountinformation,
                  value: state.isAccountInfoOn,
                  onToggle: () {
                    context
                        .read<AccountBloc>()
                        .add(ToggleAccountInformationEvent());
                  },
                  context: context,
                );
              },
            ),
            SizedBox(height: AppSize.getSize(30)),
            BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                return requestTile(
                  title: context.l10n.channelsactivity,
                  value: state.isChannelsActivityOn,
                  onToggle: () {
                    context
                        .read<AccountBloc>()
                        .add(ToggleChannelsActivityEvent());
                  },
                  context: context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget requestTile({
    required String title,
    required bool value,
    required VoidCallback onToggle,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
              color: AppTheme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.requestsent,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
                Text(
                  context.l10n.readybyDecember7_2025,
                  style: TextStyle(
                    color: AppTheme.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: AppSize.getSize(20)),

        Text(
          context.l10n
              .yourreportwillbereadyinabout3daysYoullhaveafewweekstodownloadyourreportafteritsavailable,
          style: TextStyle(
            color: AppTheme.greyShade400,
            fontSize: AppSize.getSize(16),
          ),
        ),

        SizedBox(height: AppSize.getSize(20)),

        Row(
          children: [
            Icon(
              Icons.replay_rounded,
              size: AppSize.getSize(30),
              color: AppTheme.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(8)),
            Expanded(
              child: Text(
                context.l10n.createreportsautomatically,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(17),
                ),
              ),
            ),
            Switch(
              value: value,
              activeThumbColor: AppTheme.blackColor,
              activeTrackColor: AppTheme.greenAccentShade700,
              inactiveTrackColor: AppTheme.blackColor,
              onChanged: (_) => onToggle(),
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
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              TextSpan(
                text: context.l10n.learnmore,
                style: TextStyle(
                  color: AppTheme.blueshade500,
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
