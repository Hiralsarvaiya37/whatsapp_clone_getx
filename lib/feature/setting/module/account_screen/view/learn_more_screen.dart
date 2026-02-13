// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LearnMoreScreen extends StatefulWidget {
  static const id = "/LearnMoreScreen";
  const LearnMoreScreen({super.key});

  @override
  State<LearnMoreScreen> createState() => _LearnMoreScreenState();
}

class _LearnMoreScreenState extends State<LearnMoreScreen> {
   @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(InitVideoEvent());
  }
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
          context.l10n.helparticle,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: AppTheme.greyShade900,
            offset: Offset(AppSize.getSize(0), AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            icon: Icon(
              Icons.more_vert,
              color: AppTheme.whiteColor,
              size: AppSize.getSize(25),
            ),

            itemBuilder: (context) => [
              popupTile(context.l10n.openinbrowser),
              popupTile(context.l10n.send),
              popupTile(context.l10n.copylink),
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
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(25),
                ),
              ),

              SizedBox(height: AppSize.getSize(20)),
              BlocBuilder<AccountBloc, AccountState>(
                buildWhen: (prev, curr) =>
                    prev.isVideoInitialized != curr.isVideoInitialized ||
                    prev.isPlaying != curr.isPlaying,
                builder: (context, state) {
                  final bloc = context.read<AccountBloc>();

                  if (!state.isVideoInitialized) {
                    return Container(
                      height: AppSize.getSize(200),
                      color: AppTheme.greyShade900,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: bloc.videoController!.value.aspectRatio,
                        child: VideoPlayer(bloc.videoController!),
                      ),
                      IconButton(
                        icon: Icon(
                          state.isPlaying
                              ? Icons.pause_circle
                              : Icons.play_circle,
                          size: AppSize.getSize(50),
                          color: AppTheme.whiteColor,
                        ),
                        onPressed: () {
                          context.read<AccountBloc>().add(PlayPauseEvent());
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                context
                    .l10n
                    .endtoendencryptedchatsbetweenyouandoneotherpersonhavetheirownsecuritycodethiscodeisusedtoverifythatthecallsandthemessagesyousendtothatchatareendtoendencrypted,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(8)),
              Text(
                context
                    .l10n
                    .thesecuritycodecanbefoundinthecontactinfoscreenbothasaQRcodeanda60digitnumberthesecodesareuniquetoeachindividualchattheycanbecomparedbetweenpeopleineachchattoverifythatthemessagesyousendtothechatareendtoendencyptedsecuritycodesarejustvisibleversionsofthespecialkeyssharedbetweenyouDontworryitsnottheactualkeysthemselveswhicharealwayskeptsecret,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(10)),
              Text(
                context
                    .l10n
                    .attimesthesecuritycodesusedinendtoendencryptedchatsbetweenyouandoneotherpersonmightchangeThisislikelybecauseyouoryourcontactreinstalledWhatsAppchangedphonesoraddedorremovedapaireddeviceYoucanalwaysverifythatacontactssecuritycodeislegitimte,
                style: TextStyle(
                  color: AppTheme.greyShade400,
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
                            text: context.l10n.learnhowin ,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),

                          TextSpan(
                            text: context.l10n.thisarticle,
                            style: TextStyle(
                              color: AppTheme.blueshade500,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          TextSpan(
                            text: context.l10n.onendtoendencryption,
                            style: TextStyle(
                              color: AppTheme.greyShade400,
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
                  color: AppTheme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Text(
                context
                    .l10n
                    .youcanreceivenotificationswhenyoursecuritycodechangesforacontactsphoneinanendtoendencryptedchattodosoyoullneedtoenablethesettingoneachdevicewhereyouwanttogetnotifications,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(18),
                ),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Text(
                context.l10n.enablesecuritycodenotifications,
                style: TextStyle(
                  color: AppTheme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: AppSize.getSize(7)),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color: AppTheme.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
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
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
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
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      "Turn on Show security notifications on this device.",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
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
                  color: AppTheme.greenAccentShade700,
                  fontSize: AppSize.getSize(20),
                ),
              ),
              SizedBox(height: 7),
              Row(
                children: [
                  Text(
                    "1. Tap ",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    size: AppSize.getSize(25),
                    color: AppTheme.greenAccentShade700,
                  ),
                  Text(
                    "> Settings.",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
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
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Tap Account > Security notifications.",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
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
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),

                  Expanded(
                    child: Text(
                      context.l10n.turnoffShowsecuritynotificationsonthisdevice,
                      style: TextStyle(
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state.feedback != null && state.feedback == true) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.thanksforlettingusknow,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(5)),
                        Text(
                          context
                              .l10n
                              .welluseyourfeedbacktohelpimproveWhatsAppsupport,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.check_circle_outline,
                            size: AppSize.getSize(50),
                            color: AppTheme.greenAccentShade700,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state.feedback == false) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.tellusalittlemore,
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),

                        ...List.generate(3, (index) {
                          final options = [
                            "Not helpful",
                            "Too confusing",
                            "Video didn't play",
                          ];

                          return Row(
                            children: [
                              Radio<int>(
                                value: index,
                                groupValue: state.selectedOption,
                                activeColor: AppTheme.greenAccentShade700,
                                onChanged: (value) {
                                  context.read<AccountBloc>().add(
                                    SelectOptionEvent(value!),
                                  );
                                },
                              ),
                              Text(options[index],style: TextStyle(color: AppTheme.greyShade400,fontSize: 16),),
                            ],
                          );
                        }),

                        SizedBox(height: AppSize.getSize(20)),

                        GestureDetector(
                          onTap: state.selectedOption == -1
                              ? null
                              : () {
                                  context.read<AccountBloc>().add(
                                    SubmitFeedbackEvent(true),
                                  );
                                },
                          child: Container(
                            height: AppSize.getSize(45),
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: state.selectedOption == -1
                                  ? AppTheme.greyShade800
                                  : AppTheme.greenAccentShade700,
                              borderRadius: BorderRadius.circular(
                                AppSize.getSize(20),
                              ),
                            ),
                            child: Text(
                              context.l10n.submitfeedback,
                              style: TextStyle(
                                color: state.selectedOption == -1
                                    ? AppTheme.greyShade400
                                    : AppTheme.blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Text(
                        context.l10n.doesthisansweryourquestion,
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(18),
                        ),
                      ),
                       Text(
                        context.l10n.yourresponseisanonymoushelpsusimproveourhelpresources,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(15),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: AppSize.getSize(30)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<AccountBloc>().add(
                                SubmitFeedbackEvent(true),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(color: AppTheme.greenshade900, shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.thumb_up,
                                    size: 30,
                                    color: AppTheme.greenAccentShade700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("Yes",style: TextStyle(color: AppTheme.greenAccentShade700, fontSize: 16),)
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              context.read<AccountBloc>().add(
                                SubmitFeedbackEvent(false),
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(color:AppTheme.greenshade900, shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.thumb_down,
                                    size: 30,
                                    color: AppTheme.greenAccentShade700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("No",style: TextStyle(color: AppTheme.greenAccentShade700, fontSize: 16),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  PopupMenuItem popupTile(String title) {
    return PopupMenuItem(
      child: Text(
        title,
        style: TextStyle(
          color: AppTheme.whiteColor,
          fontSize: AppSize.getSize(17),
        ),
      ),
    );
  }
}
