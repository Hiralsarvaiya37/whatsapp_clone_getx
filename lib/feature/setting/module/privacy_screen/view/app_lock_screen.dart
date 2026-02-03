import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AppLockScreen extends StatelessWidget {
  static const id = "/AppLockScreen";
  const AppLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = context.watch<PrivacyViewProvider>();
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: context.watch<AppTheme>().whiteColor),
        ),
        title: Text(
          "App lock",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child:  Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unlock with biometric",
                      style: TextStyle(color: context.watch<AppTheme>().whiteColor, fontSize: AppSize.getSize(18)),
                    ),
                    Text(
                      "When enabled, you'll need to use fingerprint, face or other unique identifiers to open WhatsApp. You can still answer calls if WhatsApp is locked.",
                      style: TextStyle(color: context.watch<AppTheme>().greyShade400, fontSize: AppSize.getSize(16)),
                    ),
                  ],
                ),
              ),
          
             Switch(value: provider.isOn,
                activeThumbColor: context.watch<AppTheme>().blackColor,
                activeTrackColor: context.watch<AppTheme>().greenAccentShade700,
                inactiveTrackColor: context.watch<AppTheme>().blackColor,
                 onChanged: (val){
                    provider.isOn = val;
                }),
            
            ],
          ),
        ),
      
    );
  }
}
