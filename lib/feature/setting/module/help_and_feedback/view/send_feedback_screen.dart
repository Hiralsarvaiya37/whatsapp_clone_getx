import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/provider/help_and_feedback_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/help_center_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SendFeedbackScreen extends StatelessWidget {
  static const id = "/SendFeedbackScreen";
  const SendFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final helpProvider = context.watch<HelpAndFeedbackViewProvider>();
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          "Send feedback",
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
                              color: context.watch<AppTheme>().greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          TextSpan(
                            text: "Help center.",
                            style: TextStyle(
                              color: context.watch<AppTheme>().greyShade800,
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
                      onTapOutside: (event) {
                        FocusScope.of(context).unfocus();
                      },
                      cursorColor: context.watch<AppTheme>().greyShade400,
                      cursorWidth: AppSize.getSize(3),
                      maxLines: 4,
                      enableInteractiveSelection: false,
                      style: TextStyle(
                        color: context.watch<AppTheme>().whiteColor,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        labelText: "Describe the technical issue",
                        floatingLabelStyle: TextStyle(
                          color: context.watch<AppTheme>().greenAccentShade700,
                          fontSize: AppSize.getSize(18),
                        ),
                        labelStyle: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(10),
                          ),
                          borderSide: BorderSide(
                            color: context.watch<AppTheme>().greyColor,
                            width: AppSize.getSize(2),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(10),
                          ),
                          borderSide: BorderSide(
                            color: context.watch<AppTheme>().greyShade800,
                            width: AppSize.getSize(2),
                          ),
                        ),
                      ),
                      onTap: () {
                        helpProvider.isShow = false;
                      },
                      onChanged: (value) {
                        helpProvider.hasText = value.isNotEmpty;
                      },
                    ),

                    SizedBox(height: AppSize.getSize(25)),
                    Text(
                      "Screenshots or recordings (optional) Tap screenshot to edit or remove sensitive info",
                      style: TextStyle(
                        color: context.watch<AppTheme>().greyShade400,
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
                            color: context.watch<AppTheme>().greyShade800,
                          ),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: AppSize.getSize(25),
                            color: context.watch<AppTheme>().whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            helpProvider.isShow
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By sending, you allow WhatsApp to review related technical info to help address your feedback.",
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LearnMoreScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Learn more",
                          style: TextStyle(
                            color: context.watch<AppTheme>().greyShade400,
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
                      color: helpProvider.hasText
                          ? context.watch<AppTheme>().greenAccentShade700
                          : context.watch<AppTheme>().greyShade800,
                      borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                    ),
                    child: Text(
                      "Send",
                      style: TextStyle(
                        color: helpProvider.hasText
                            ? context.watch<AppTheme>().blackColor
                            : context.watch<AppTheme>().greyShade400,
                        fontSize: AppSize.getSize(15),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
