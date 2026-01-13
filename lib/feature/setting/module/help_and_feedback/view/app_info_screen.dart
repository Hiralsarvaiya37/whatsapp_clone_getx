import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AppInfoScreen extends StatelessWidget {
  static const id = "/AppInfoScreen";
  const AppInfoScreen({super.key});

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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "WhatsApp Messenger",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: AppSize.getSize(22),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Version 2.52.81.77",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  Icon(Icons.call, size: 50, color: AppColors.whiteColor),
                  SizedBox(height: AppSize.getSize(25)),
                  Text(
                    "@2011 - 2025 WhatsApp Inc.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: 16),
                  ),
                  SizedBox(height: AppSize.getSize(25)),
                  Container(
                    height: AppSize.getSize(40),
                    width: AppSize.getSize(120),
                    decoration: BoxDecoration(
                      color: AppColors.greenAccentShade700,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Licenses",
                      style: TextStyle(
                        fontSize: AppSize.getSize(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
