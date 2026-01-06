import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/controller/help_and_feedback_view_controller.dart';
import 'package:whatsapp_clone_getx/setting/help_and_feedback/view/help_center_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class SendFeedbackScreen extends StatelessWidget {
  SendFeedbackScreen({super.key});

  final HelpAndFeedbackViewController sendController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Send feedback",
          style: TextStyle(
            color: AppColors.whiteColor,
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "For other issues like span or scams, you can get help or contact support from the ",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          TextSpan(
                            text: "Help center.",
                            style: TextStyle(
                              color: AppColors.greyShade800,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(16),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HelpCenterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(20)),

                    TextField(
                      cursorColor: AppColors.greyShade400,
                      cursorWidth: AppSize.getSize(3),
                      maxLines: 4,
                      enableInteractiveSelection: false,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: "Describe the technical issue",
                        floatingLabelStyle: TextStyle(
                          color: AppColors.greenAccentShade700,
                          fontSize: AppSize.getSize(18),
                        ),
                        labelStyle: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(10),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.greyColor,
                            width: AppSize.getSize(2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(10),
                          ),
                          borderSide: BorderSide(
                            color: AppColors.greyShade800,
                            width: AppSize.getSize(2),
                          ),
                        ),
                      ),
                      onTap: () {
                        sendController.isShow.value = false;
                      },
                      onChanged: (value) {
                        sendController.hasText.value = value.isNotEmpty;
                      },
                    ),

                    SizedBox(height: AppSize.getSize(25)),
                    Text(
                      "Screenshots or recordings (optional) Tap screenshot to edit or remove sensitive info",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                    SizedBox(height: AppSize.getSize(10)),

                    Row(
                      children: [
                        Container(
                          height: AppSize.getSize(95),
                          width: AppSize.getSize(95),
                          decoration: BoxDecoration(
                            color: AppColors.greyShade800,
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: AppSize.getSize(25),
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Obx(() {
              return sendController.isShow.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "By sending, you allow WhatsApp to review related technical info to help address your feedback.",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LearnMoreScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Learn more",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(
                      height: AppSize.getSize(40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: sendController.hasText.value
                            ? AppColors.greenAccentShade700
                            : AppColors.greyShade800,
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(30),
                        ),
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: sendController.hasText.value
                              ? AppColors.blackColor
                              : AppColors.greyShade400,
                          fontSize: AppSize.getSize(15),
                        ),
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
