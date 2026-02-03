import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ConnectingWithCustomersScreen extends StatelessWidget {
  static const id = "/ConnectingWithCustomersScreen";
  const ConnectingWithCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          "Connecting with Customers",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: context.watch<AppTheme>().whiteColor,
            ),
            color: context.watch<AppTheme>().greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: context.watch<AppTheme>().whiteColor,
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
                    "Connecting with Customers",
                    style: TextStyle(
                      color: context.watch<AppTheme>().greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),

                  appInfo("About channels on the WhatsApp Business app", context),
                  appInfo("About communities on the WhatsApp Business app", context),
                  appInfo("How to customize how your business appears in chats with customers", context),
                  appInfo("How use quick replies", context),
                  appInfo("How to use greeting messages", context),
                  appInfo("How to use labels", context),
                  appInfo("How to use away messages", context),
                  appInfo("How to create short links", context),
                  appInfo("How to apply chatlist filters", context),
                  appInfo("About marketing messages", context),
                  appInfo("About pricing for marketing messages", context),
                  appInfo("How to create and send a marketing message", context),
                  appInfo("How to manage your marketing messages", context),
                  appInfo("Why is Meta reviewing my marketing messages?", context),
                  appInfo("How to turn broadcast lists into marketing messages", context),
                  appInfo("About QR code for WhatsApp Business", context),
                  appInfo("How to share your WhatsApp Business QR code", context),
                  appInfo("How to print your QR code for WhatsApp Business", context),
                  appInfo("About sharing customer-related activities to help bussinesses connect with customers", context),
                  appInfo("About using the WhatsApp Business app to communicate with your customers", context),
                  appInfo("How to engage with customers using the WhatsApp Business directory", context),
                  appInfo("About linking WhatsApp Business with Facebook and instagram", context),
                  appInfo("How to add a WhatsApp Business account to a facebook page", context),
                  appInfo("How to create a link to your WhatsApp from your Google Business Profile", context),
                  appInfo("About using Business AI to chat with customers", context),
                  appInfo("How to set up Business AI", context),
                  appInfo("How to teach Business AI", context),
                  appInfo("How to pause or disconnect Business AI", context),
                  appInfo("How to remove Business AI from an individual chat", context),
                  appInfo("About Business AI behaviors in chats", context),

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
     Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: AppSize.getSize(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.file_open_sharp,
              size: AppSize.getSize(30),
              color: context.watch<AppTheme>().greyShade400,
            ),
            SizedBox(width: AppSize.getSize(30)),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: context.watch<AppTheme>().whiteColor,
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
