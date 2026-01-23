import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SecurityNotificationsScreen extends GetView<AccountViewController> {
  static const id ="/SecurityNotificationsScreen";
  const SecurityNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          context.l10n.securitynotifications,
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                  color: AppTheme.greenAccentShade700,
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
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Text(
                          context.l10n.endtoendencryptionkeepsyourpersonalmessagedandcallsbetweenyouandthepeopleyouchoosenooneoutsideofthechatnotevenWhatsAppcanreadlistentoorsharethemthisincludesyour,
                          softWrap: true,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
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
                        color: AppTheme.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.textandvoicemessages,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                        color: AppTheme.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.audioandvideocalls,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                        color: AppTheme.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.photosvideosanddocuments,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                        color: AppTheme.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.locationsharing,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                        color: AppTheme.greenAccentShade700,
                        size: AppSize.getSize(25),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Text(
                        context.l10n.statusupdates,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
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
                          color: AppTheme.blueshade500,
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
                                context.l10n.showsecuritynotificationsonthisdevice,
                                style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                ),
                              ),
                            ),
                            Obx(
                              ()=> Switch(
                                value:
                                    controller.isNotificationOn.value,
                                activeThumbColor: AppTheme.blackColor,
                                activeTrackColor: AppTheme.greenAccentShade700,
                                inactiveTrackColor: AppTheme.blackColor,
                                onChanged: (val) {
                                  controller.isNotificationOn.value =
                                      val;
                                },
                              ),
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
                                  color: AppTheme.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                              TextSpan(
                                text: context.l10n.learnmore,
                                style: TextStyle(
                                  color: AppTheme.blueshade500,
                                  fontSize: AppSize.getSize(16),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(LearnMoreScreen.id);
                                    
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
