import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Add your email",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.email, color: AppColors.greenAccentShade700, size: AppSize.getSize(80)),
            SizedBox(height: AppSize.getSize(15)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Email helps us verify your account or reach you in case of security or support issues. your email address Won't be visible to others.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),

                  TextSpan(
                    text: "Leaen more",
                    style: TextStyle(
                      color: AppColors.greenAccentShade700,
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
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSize.getSize(30)),

            TextField(
              cursorColor: AppColors.greenAccentShade700,
              style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(18)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greenAccentShade700,
                    width: AppSize.getSize(2),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greenAccentShade700,
                    width: AppSize.getSize(2),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.blackColor,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.greenAccentShade700,
            borderRadius: BorderRadius.circular(AppSize.getSize(30)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.getSize(15)),
            child: Text(
              "Next",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
