import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ScheduledCallsScreen extends StatelessWidget {
  static const id = "/ScheduledCallsScreen";
  const ScheduledCallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Scheduled calls",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(22),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.call_outlined,
              size: AppSize.getSize(60),
              color: AppTheme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(25)),
            Text(
              "Schedule a call",
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(25),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.getSize(8)),
            Text(
              "Invite people or groups to join a call.",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(17),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppTheme.blackColor,
        height: AppSize.getSize(65),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.greenAccentShade700,
            borderRadius: BorderRadius.circular(AppSize.getSize(30)),
          ),
          alignment: Alignment.center,
          child: Text(
            "Schedule a call",
            style: TextStyle(
              fontSize: AppSize.getSize(16),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
