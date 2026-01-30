import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyContactsScreen extends StatelessWidget {
  static const id = "/PrivacyContactsScreen";
  const PrivacyContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PrivacyViewProvider>();
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          "Contacts",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Blocked contacts",
                style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(19)),
              ),
              Text(
                "0",
                style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(19)),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WhatsApp contacts",
                          style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(19)),
                        ),
                        SizedBox(height: AppSize.getSize(19)),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Contacts are saved to your WhatsApp account to manage them across devices. ",
                                style: TextStyle(
                                  color: AppTheme.greyShade400,
                                  fontSize: AppSize.getSize(17),
                                ),
                              ),
                              TextSpan(
                                text: "Learn more",
                                style: TextStyle(
                                  color: AppTheme.blueshade500,
                                  fontSize: AppSize.getSize(17),
                                  fontWeight: FontWeight.w600,
                                ),recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                                }
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                      value: provider.isOn,
                      activeThumbColor: AppTheme.blackColor,
                      activeTrackColor: AppTheme.greenAccentShade700,
                      inactiveTrackColor: AppTheme.blackColor,
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
