import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class RequestAccountInfoScreen extends GetView<AccountViewController> {
   static const id="/RequestAccountInfoScreen";
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
            requestTile(
              title: context.l10n.accountinformation,
              rxValue: controller.isOn,
              context: context,
            ),
            SizedBox(height: AppSize.getSize(30)),
            requestTile(
              title: context.l10n.channelsactivity,
              rxValue: controller.isYes,
              context: context,
            ),
          ],
        ),
      ),
    );
  }


  Widget requestTile({
    required String title,
    required RxBool rxValue,
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
          context.l10n.yourreportwillbereadyinabout3daysYoullhaveafewweekstodownloadyourreportafteritsavailable,
          style: TextStyle(
            color: AppTheme.greyShade400,
            fontSize: AppSize.getSize(16),
          ),
        ),

        SizedBox(height: AppSize.getSize(20)),

        InkWell(
          onTap: () => rxValue.value = !rxValue.value,
          child: Row(
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

            
              Obx(
                () => Switch(
                  value: rxValue.value,
                  activeThumbColor: AppTheme.blackColor,
                  activeTrackColor: AppTheme.greenAccentShade700,
                  inactiveTrackColor: AppTheme.blackColor,
                  onChanged: (val) => rxValue.value = val,
                ),
              ),
            ],
          ),
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
                text: context.l10n.leaenmore,
                style: TextStyle(
                  color: AppTheme.blueshade500,
                  fontSize: AppSize.getSize(16),
                  fontWeight: FontWeight.w600,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.toNamed(LearnMoreScreen.id);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
