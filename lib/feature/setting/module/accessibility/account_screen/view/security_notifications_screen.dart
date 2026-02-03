import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SecurityNotificationsScreen extends StatelessWidget {
  static const id = "/SecurityNotificationsScreen";
  const SecurityNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = context.watch<AccountViewProvider>();
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          context.l10n.securitynotifications,
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            children: [
              SizedBox(height: AppSize.getSize(10)),
              Center(
                child: Icon(
                  Icons.lock,
                  color: context.watch<AppTheme>().greenAccentShade700,
                  size: AppSize.getSize(80),
                ),
              ),

              SizedBox(height: AppSize.getSize(35)),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.yourchatsandcallsareprivate,
                          style: TextStyle(
                            color: context.watch<AppTheme>().whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Text(
                          context
                              .l10n
                              .endtoendencryptionkeepsyourpersonalmessagedandcallsbetweenyouandthepeopleyouchoosenooneoutsideofthechatnotevenWhatsAppcanreadlistentoorsharethemthisincludesyour,
                          softWrap: true,
                          style: TextStyle(
                            color: context.watch<AppTheme>().greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.message,
                        color: context.watch<AppTheme>().greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.textandvoicemessages,
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: context.watch<AppTheme>().greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.audioandvideocalls,
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.crop_portrait,
                        color: context.watch<AppTheme>().greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.photosvideosanddocuments,
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: context.watch<AppTheme>().greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.locationsharing,
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(7)),
                  Row(
                    children: [
                      Icon(
                        Icons.update_sharp,
                        color: context.watch<AppTheme>().greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.statusupdates,
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
                          fontSize: AppSize.getSize(17),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(15)),
                  Row(
                    children: [
                      Text(
                        context.l10n.learnmore,
                        style: TextStyle(
                          color: context.watch<AppTheme>().blueshade500,
                          fontSize: AppSize.getSize(18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.getSize(35)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              context
                                  .l10n
                                  .showsecuritynotificationsonthisdevice,
                              style: TextStyle(
                                color: context.watch<AppTheme>().whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                          ),
                          Switch(
                            value: accountProvider.isNotificationOn,
                            activeThumbColor: context.watch<AppTheme>().blackColor,
                            activeTrackColor: context.watch<AppTheme>().greenAccentShade700,
                            inactiveTrackColor: context.watch<AppTheme>().blackColor,
                            onChanged: (val) {
                              accountProvider.toggleisNotificationOn();
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: AppSize.getSize(10)),

                      Padding(
                        padding: EdgeInsets.only(right: AppSize.getSize(60)),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Get notified when your security code changes for a contact's phone "
                                    "in an end-to-end encrypted chat. If you have multiple devices, this "
                                    "setting must be enabled on each device where you want to get notifications. ",
                                style: TextStyle(
                                  color: context.watch<AppTheme>().greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                              TextSpan(
                                text: context.l10n.learnmore,
                                style: TextStyle(
                                  color: context.watch<AppTheme>().blueshade500,
                                  fontSize: AppSize.getSize(16),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
