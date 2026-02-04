import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class CallsScreen extends StatelessWidget{
  static const id = "/CallsScreen";
  const CallsScreen({super.key});


  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
     final provider = context.watch<PrivacyViewProvider>();
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
          "Calls",
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Slience unknown callers",
                    style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                  SizedBox(height: AppSize.getSize(10)),
                  Text(
                    "Calls from unknown numbers will be silenced. They will still be shown in the calls tab and in your notifications. ",
                    style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  InkWell(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                    },
                    child: Text(
                      "Learn more",
                      style: TextStyle(
                        color: theme.blueshade500,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Column(
                children: [
                  Switch(
                    value: provider.isOn,
                    activeThumbColor: theme.blackColor,
                    activeTrackColor: theme.greenAccentShade700,
                    inactiveTrackColor: theme.blackColor,
                    onChanged: (val) {
                        provider.isOn = val;
                    },
                  ),
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}
