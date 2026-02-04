import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/email_address_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/two_step_verification_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PrivacyCheckupScreen4 extends StatelessWidget {
  static const id = "/PrivacyCheckupScreen4";
  const PrivacyCheckupScreen4({super.key});

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
          "Privacy checkup",
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
            SizedBox(height: AppSize.getSize(20)),
            Icon(
              Icons.person_add_alt_outlined,
              size: AppSize.getSize(70),
              color: theme.greenAccentShade700,
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Add more protection to your account",
              style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(24)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text(
              "Help protect your account by adding an extra layer of security.",
              style: TextStyle(color: theme.greyShade400, fontSize: 16),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSize.getSize(35)),

            appInfo(
              "Two_step verification",
              "Create a PIN that will be required when you register your phone number again on WhatsApp.",
              Icons.keyboard_control_rounded,
              () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TwoStepVerificationScreen()));
              },context
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Passkey",
              "Log in to WhatsApp using your face, fingerprint or device passcode.",
              Icons.person_add_alt_1_outlined,
              () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>PassKeysScreen()));
              },context
            ),
            SizedBox(height: AppSize.getSize(30)),
            appInfo(
              "Recovery email",
              "Add a trusted email to help access your WhatsApp account.",
              Icons.email_outlined,
              () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailAddressScreen()));
              },context
            ),
          ],
        ),
      ),
    );
  }

  Widget appInfo(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
    BuildContext context
  ) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: AppSize.getSize(30), color: theme.greyShade400),
          SizedBox(width: AppSize.getSize(20)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: theme.whiteColor, fontSize: AppSize.getSize(18)),
                ),
                SizedBox(height: AppSize.getSize(5)),
                Text(
                  subtitle,
                  style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(40)),
          Icon(Icons.arrow_forward, size: AppSize.getSize(25), color: theme.greyShade400),
        ],
      ),
    );
  }
}
