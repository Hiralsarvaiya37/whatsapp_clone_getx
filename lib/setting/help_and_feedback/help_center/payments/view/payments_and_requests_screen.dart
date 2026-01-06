import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class PaymentsAndRequestsScreen extends StatelessWidget {
  const PaymentsAndRequestsScreen({super.key});

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
          "Payments and Requests",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppColors.whiteColor,
            ),
            color: AppColors.greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(20),
                vertical: AppSize.getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payments and Requests",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  appInfo("How to send money using UPI ID", context),
                  appInfo("How to check your bank account balance", context),
                  appInfo("How to receive money", context),
                  appInfo("How to send money using OR code", context),
                  appInfo("How to pay for an order on WhatsApp", context),
                  appInfo("How to view payments history on WhatsApp", context),
                  appInfo("About successful transactions on WhatsApp", context),
                  appInfo("How to add stickers to payments", context),
                  SizedBox(height: AppSize.getSize(40)),
                ],
              ),
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LearnMoreScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: AppColors.greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppSize.getSize(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
