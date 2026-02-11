// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LearnMoreScreen extends StatelessWidget {
  static const id = "/LearnMoreScreen";
  const LearnMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = context.watch<AccountViewProvider>();
    final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor:theme.blackColor,
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
          context.l10n.helparticle,
          style: TextStyle(
            color:theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
           
        actions: [
          PopupMenuButton(
            color: theme.greyShade900,
            offset: Offset(AppSize.getSize(0), AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            icon: Icon(
              Icons.more_vert,
              color: theme.whiteColor,
              size: AppSize.getSize(25),
            ),

            itemBuilder: (context) => [
              popupTile(context.l10n.openinbrowser, context),
              popupTile(context.l10n.send, context),
              popupTile(context.l10n.copylink, context),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.aboutsecuritycodechangenotifications,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(25),
                ),
              ),

              SizedBox(height: AppSize.getSize(20)),

              accountProvider.isInitialized
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio:
                              accountProvider.videoController.value.aspectRatio,
                          child: VideoPlayer(accountProvider.videoController),
                        ),
                        IconButton(
                          icon: Icon(
                            accountProvider.isPlaying
                                ? Icons.pause_circle
                                : Icons.play_circle,
                            size: AppSize.getSize(50),
                            color: theme.whiteColor,
                          ),
                          onPressed: () {
                            accountProvider.playPause();
                          },
                        ),
                      ],
                    )
                  : Container(
                      height: AppSize.getSize(200),
                      color: theme.greyShade900,
                      child: Center(child: CircularProgressIndicator()),
                    ),

              SizedBox(height: AppSize.getSize(20)),
              Text(
                context
                    .l10n
                    .endtoendencryptedchatsbetweenyouandoneotherpersonhavetheirownsecuritycodethiscodeisusedtoverifythatthecallsandthemessagesyousendtothatchatareendtoendencrypted,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(8)),
              Text(
                context
                    .l10n
                    .thesecuritycodecanbefoundinthecontactinfoscreenbothasaQRcodeanda60digitnumberthesecodesareuniquetoeachindividualchattheycanbecomparedbetweenpeopleineachchattoverifythatthemessagesyousendtothechatareendtoendencyptedsecuritycodesarejustvisibleversionsofthespecialkeyssharedbetweenyouDontworryitsnottheactualkeysthemselveswhicharealwayskeptsecret,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(10)),
              Text(
                context
                    .l10n
                    .attimesthesecuritycodesusedinendtoendencryptedchatsbetweenyouandoneotherpersonmightchangeThisislikelybecauseyouoryourcontactreinstalledWhatsAppchangedphonesoraddedorremovedapaireddeviceYoucanalwaysverifythatacontactssecuritycodeislegitimte,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(5)),
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.l10n.learnhowin,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),

                          TextSpan(
                            text: context.l10n.thisarticle,
                            style: TextStyle(
                              color: theme.blueshade500,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          TextSpan(
                            text: context.l10n.onendtoendencryption,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(25)),

              Text(
                context.l10n.receivenotificationwhensecuritycodeschange,
                style: TextStyle(
                  color: theme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Text(
                context
                    .l10n
                    .youcanreceivenotificationswhenyoursecuritycodechangesforacontactsphoneinanendtoendencryptedchattodosoyoullneedtoenablethesettingoneachdevicewhereyouwanttogetnotifications,
                style: TextStyle(
                  color: theme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Text(
                context.l10n.enablesecuritycodenotifications,
                style: TextStyle(
                  color: theme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color: theme.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. ",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3. ",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Turn on Show security notifications on this device.",
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "Disable security code notifications",
                style: TextStyle(
                  color: theme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color:theme.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2. ",
                    style: TextStyle(
                      color:theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color:theme.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3. ",
                    style: TextStyle(
                      color: theme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      context.l10n.turnoffShowsecuritynotificationsonthisdevice,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),
              accountProvider.isYes
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.thanksforlettingusknow,
                          style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(5)),
                        Padding(
                          padding: EdgeInsets.only(left: AppSize.getSize(10)),
                          child: Text(
                            context
                                .l10n
                                .welluseyourfeedbacktohelpimproveWhatsAppsupport,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:theme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.check_circle_outline,
                            size: AppSize.getSize(50),
                            color: context
                                .watch<AppTheme>()
                                .greenAccentShade700,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                      ],
                    )
                  : accountProvider.isNo
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            context.l10n.tellusalittlemore,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Column(
                          children: List.generate(
                            accountProvider.options.length,
                            (index) {
                              return Row(
                                children: [
                                  Radio<int>(
                                    value: index,
                                    groupValue: accountProvider.selectedOption,
                                    onChanged: (value) {
                                      accountProvider.setSelectedOption(value!);
                                    },
                                    activeColor: context
                                        .watch<AppTheme>()
                                        .greenAccentShade700,
                                  ),
                                  SizedBox(width: AppSize.getSize(5)),
                                  Expanded(
                                    child: Text(
                                      accountProvider.options[index],
                                      style: TextStyle(
                                        color: context
                                            .watch<AppTheme>()
                                            .whiteColor,
                                        fontSize: AppSize.getSize(16),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),

                        SizedBox(height: AppSize.getSize(30)),
                        GestureDetector(
                          onTap: accountProvider.selectedOption == -1
                              ? null
                              : () {
                                  accountProvider.setYes();
                                  accountProvider.setNo();
                                },
                          child: Container(
                            height: AppSize.getSize(45),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: accountProvider.selectedOption == -1
                                  ? theme.greyShade800
                                  : context
                                        .watch<AppTheme>()
                                        .greenAccentShade700,
                              borderRadius: BorderRadius.circular(
                                AppSize.getSize(20),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                context.l10n.submitfeedback,
                                style: TextStyle(
                                  color: accountProvider.selectedOption == -1
                                      ? theme.greyShade400
                                      : theme.blackColor,
                                  fontSize: AppSize.getSize(16),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text(
                          context.l10n.doesthisansweryourquestion,
                          style: TextStyle(
                            color:theme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(5)),
                        Text(
                          context
                              .l10n
                              .yourresponseisanonymoushelpsusimproveourhelpresources,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color:theme.greyShade400,
                            fontSize: AppSize.getSize(15),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => accountProvider.setYes(),
                                  child: Container(
                                    height: AppSize.getSize(50),
                                    width: AppSize.getSize(50),
                                    decoration: BoxDecoration(
                                      color: context
                                          .watch<AppTheme>()
                                          .greenshade900,
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(50),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.thumb_up_alt,
                                      color: context
                                          .watch<AppTheme>()
                                          .greenAccentShade700,
                                      size: AppSize.getSize(25),
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(7)),
                                Text(
                                  context.l10n.yes,
                                  style: TextStyle(
                                    color: context
                                        .watch<AppTheme>()
                                        .greenAccentShade700,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: AppSize.getSize(50)),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () => accountProvider.setNo(),
                                  child: Container(
                                    height: AppSize.getSize(50),
                                    width: AppSize.getSize(50),
                                    decoration: BoxDecoration(
                                      color: context
                                          .watch<AppTheme>()
                                          .greenshade900,
                                      borderRadius: BorderRadius.circular(
                                        AppSize.getSize(50),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.thumb_down,
                                      color: context
                                          .watch<AppTheme>()
                                          .greenAccentShade700,
                                      size: AppSize.getSize(25),
                                    ),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(7)),
                                Text(
                                  context.l10n.no,
                                  style: TextStyle(
                                    color: context
                                        .watch<AppTheme>()
                                        .greenAccentShade700,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
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

  PopupMenuItem popupTile(String title, BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return PopupMenuItem(
      child: Text(
        title,
        style: TextStyle(
          color: theme.whiteColor,
          fontSize: AppSize.getSize(17),
        ),
      ),
    );
  }
}
