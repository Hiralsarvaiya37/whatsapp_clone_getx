import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class HelpScreen extends StatelessWidget {
  static const id = "/HelpScreen";
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          "Search Help Center",
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(22),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Is this your question?",
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),
              appTitle("About UPI",context),
              appTitle("How to add your bank account",context),
              appTitle("How to change or set up new UPI PIN on...",context),
              appTitle("Can't add bank account",context),
              appTitle("How to chnage or remove a bank account",context),
              appTitle("How to check your bank account balance",context),
              appTitle("How to receive money",context),
              appTitle("How to send money",context),
              appTitle("Issues with payments",context),
              appTitle("About refunds and customer support",context),
              appTitle("Payments data",context),
              appTitle("About payments security",context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.blackColor,
        height: AppSize.getSize(65),
        child: Container(
          decoration: BoxDecoration(
            color: theme.greenAccentShade700,
            borderRadius: BorderRadius.circular(AppSize.getSize(30)),
          ),
          alignment: Alignment.center,
          child: Text(
            "Send my question to Whatsapp Support",
            style: TextStyle(
              fontSize: AppSize.getSize(16),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget appTitle(String title,BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.getSize(14)),
          child: Text(
            title,
            style: TextStyle(
              color: theme.whiteColor,
              fontSize: AppSize.getSize(18),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: AppSize.getSize(10)),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: theme.greyShade900, width: 1),
          ),
        ),
      ],
    );
  }
}
