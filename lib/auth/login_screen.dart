// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/auth/auth_ctr.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthCtr controller = Get.put(AuthCtr());

  @override
  void dispose() {
    Get.delete<AuthCtr>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: AppSize.getSize(350),
                decoration: BoxDecoration(
                  color: AppColors.greyShade500.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.getSize(12),
                    vertical: AppSize.getSize(18),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: AppSize.getSize(24),
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(12)),
                      loginInfo(
                        "Email",
                        "Enter your email",
                        controller.emailCtr,
                      ),
                      SizedBox(height: AppSize.getSize(17)),
                      loginInfo("Name", "Enter your name", controller.nameCtr),
                      SizedBox(height: AppSize.getSize(17)),
                      loginInfo("Password", "Password", controller.passCtr),
                      SizedBox(height: AppSize.getSize(30)),
                      GestureDetector(
                        onTap: () {
                          controller.onAuth();
                        },
                        child: Container(
                          height: AppSize.getSize(37),
                          decoration: BoxDecoration(
                            color: AppColors.greyShade900,
                            borderRadius: BorderRadius.circular(
                              AppSize.getSize(20),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(AppSize.getSize(18)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginInfo(
    String title,
    String subtitle,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(16),
          ),
        ),
        SizedBox(height: AppSize.getSize(5)),
        TextField(
          style: TextStyle(color: AppColors.whiteColor),
          cursorColor: AppColors.greenAccentShade700,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.greyShade800,
            hintText: subtitle,
            hintStyle: TextStyle(color: AppColors.greyShade400),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(15)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
