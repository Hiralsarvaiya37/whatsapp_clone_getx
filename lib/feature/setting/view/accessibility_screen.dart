import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/view/animation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AccessibilityScreen extends StatelessWidget {
  static const id ="/AccessibilityScreen";
  const AccessibilityScreen({super.key});


  @override
  Widget build(BuildContext context) {
     final provider = context.watch<SettingProvider>();
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
         context.l10n.accessibility,
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
            InkWell(
              onTap: () {
                  provider.isOn = !provider.isOn;
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.increasecontrast,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          context.l10n.darkenkeycolorstomakethingseasiertoseewhileinlightmode,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppSize.getSize(15)),
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
            ),
            SizedBox(height: AppSize.getSize(40)),
            InkWell(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AnimationScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.animation,
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    context.l10n.choosewhetherstickersandGIFsmoveautomatically,
                    style: TextStyle(color: AppTheme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
