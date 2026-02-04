import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LiveLocationScreen extends StatelessWidget {
  static const id = "/LiveLocationScreen";
  const LiveLocationScreen({super.key});

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
          "Live location",
          style: TextStyle(
            color: theme.whiteColor,
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
            SizedBox(height: AppSize.getSize(10)),
            Icon(
              Icons.location_on_sharp,
              color: theme.greenAccentShade700,
              size: AppSize.getSize(80),
            ),
            SizedBox(height: AppSize.getSize(40)),
            Text(
              "You aren't sharing live location in any chats",
              style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
            ),
            SizedBox(height: AppSize.getSize(25)),
            Text(
              "Live location requires background location. you can manage this in your devices settings.",
              style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
            ),
          ],
        ),
      ),
    );
  }
}
