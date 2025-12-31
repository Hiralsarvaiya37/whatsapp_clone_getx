import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class RequestAccountInfoScreen extends StatelessWidget {
  RequestAccountInfoScreen({super.key});

  final AccountViewController requestController = Get.find();

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Request account info",
          style: TextStyle(
            color: AppColors.whiteColor,
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
          child: Obx(
            () => Column(
              children: [
                appTitle("Account information", requestController.isOn.value, (
                  val,
                ) {
                  requestController.isOn.value = val;
                }, context),
                SizedBox(height: AppSize.getSize(30)),
                appTitle("Channels activity", requestController.isYes.value, (
                  val,
                ) {
                  requestController.isYes.value = val;
                }, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appTitle(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: AppSize.getSize(30)),
        Row(
          children: [
            Icon(
              Icons.access_time_rounded,
              size: AppSize.getSize(30),
              color: AppColors.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Request sent",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
                Text(
                  "Ready by December 7,2025",
                  style: TextStyle(
                    color: AppColors.greyShade400,
                    fontSize: AppSize.getSize(17),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSize.getSize(25)),
        Text(
          "Your report will be ready in about 3 days. you'll have a few weeks to download your report after it's available.",
          style: TextStyle(
            color: AppColors.greyShade400,
            fontSize: AppSize.getSize(16),
          ),
        ),
        SizedBox(height: AppSize.getSize(20)),
        Text(
          "Your request will be canceled if you make changes to your account such as changing your number or deleting your account.",
          style: TextStyle(
            color: AppColors.greyShade400,
            fontSize: AppSize.getSize(16),
          ),
        ),
        SizedBox(height: AppSize.getSize(30)),
        InkWell(
          onTap: () {
            onChanged(!value);
          },
          child: Row(
            children: [
              Icon(
                Icons.replay_rounded,
                size: AppSize.getSize(30),
                color: AppColors.greyShade400,
              ),
              SizedBox(width: AppSize.getSize(6)),
              Expanded(
                child: Text(
                  "Create reports automatically",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(17),
                  ),
                ),
              ),
              Switch(
                value: value,
                activeThumbColor: AppColors.blackColor,
                activeTrackColor: AppColors.greenAccentShade700,
                inactiveTrackColor: AppColors.blackColor,
                onChanged: onChanged,
              ),
            ],
          ),
        ),

        SizedBox(height: AppSize.getSize(20)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "A new report will be created every month.",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              TextSpan(
                text: "Learn more.",
                style: TextStyle(
                  color: AppColors.blueshade500,
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
