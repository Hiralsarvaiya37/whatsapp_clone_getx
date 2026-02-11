import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class EmailAddressScreen extends StatelessWidget {
  static const id = "/EmailAddressScreen";
  const EmailAddressScreen({super.key});

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
          context.l10n.addyouremail,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: theme.greenAccentShade700,
              size: AppSize.getSize(80),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        context.l10n.emailhelpsusverifyyouraccountorreachyouincaseofsecurityorsupportissuesyouremailaddressWontbevisibletoothers,
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),

                  TextSpan(
                    text: context.l10n.learnmore,
                    style: TextStyle(
                      color: theme.greenAccentShade700,
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

            SizedBox(height: AppSize.getSize(30)),

            TextField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              cursorColor: theme.greenAccentShade700,
              style: TextStyle(
                color: theme.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
              decoration: InputDecoration(
                hintText: context.l10n.enteryouremail,
                hintStyle: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.greenAccentShade700,
                    width: AppSize.getSize(2),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.greenAccentShade700,
                    width: AppSize.getSize(2),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.blackColor,
        child: Container(
          decoration: BoxDecoration(
            color: theme.greenAccentShade700,
            borderRadius: BorderRadius.circular(AppSize.getSize(30)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.getSize(15)),
            child: Text(
              context.l10n.next,
              style: TextStyle(
                color: theme.blackColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
