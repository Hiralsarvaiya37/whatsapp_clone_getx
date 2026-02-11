import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class TwoStepVerificationScreen extends StatelessWidget {
   static const id="/TwoStepVerificationScreen";
  const TwoStepVerificationScreen({super.key});

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
          context.l10n.twostepverification,
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
            SizedBox(height: AppSize.getSize(15)),
            Icon(Icons.keyboard, size: AppSize.getSize(70), color: theme.greenAccentShade700),
            SizedBox(height: AppSize.getSize(30)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        context.l10n.forextrasecurityturnontwostepverificationwhichwillrequireaPINwhenregisteringyourphonenumberwithWhatsAppagain,

                    style: TextStyle(color: theme.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  TextSpan(
                    text: context.l10n.learnmore,
                    style: TextStyle(
                      color: theme.blueshade500,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: theme.blackColor,
        child: Center(
          child: Container(
            height: AppSize.getSize(45),
            width: AppSize.getSize(120),
            decoration: BoxDecoration(
              color: theme.greenAccentShade700,
              borderRadius: BorderRadius.circular(AppSize.getSize(25)),
            ),
            alignment: Alignment.center,
            child: Text(
              context.l10n.turnon,
              style: TextStyle(color: theme.blackColor, fontSize: AppSize.getSize(16), fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
