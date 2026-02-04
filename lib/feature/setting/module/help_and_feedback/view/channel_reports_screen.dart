import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChannelReportsScreen extends StatelessWidget {
  static const id = "/ChannelReportsScreen";
  const ChannelReportsScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.whiteColor),
        ),
        title: Text(
          "Channel reports",
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No reports",
              style: TextStyle(
                color: theme.whiteColor,
                fontSize: AppSize.getSize(22),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSize.getSize(5)),
            Text(
              "If you report a channel, you can see your report and the outcome here.",
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
