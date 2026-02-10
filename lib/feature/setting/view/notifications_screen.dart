import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_state.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  static const id = "/NotificationsScreen";
  const NotificationsScreen({super.key});

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
          context.l10n.notifications,
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<SettingBloc, SettingState>(builder: (context, state){
        return  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              radioTile(
                context,
                context.l10n.conversationtones,
                context.l10n.playsoundsforincomingandoutgoingmessages,
                index: 0,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                index: 1,
                context.l10n.reminders,
                context
                    .l10n
                    .getoccasionalremindersaboutmessagescallsorstatusupdatesyouhaventseen,
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.message,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(15),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                context,
                context.l10n.notificationtone,
                state.selectedOption,
                showSwitch: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.vibrate,
               state.selectedOption,
                showSwitch: false,
                isShow: true,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.popupnotification,
                context.l10n.notavailable,
                showSwitch: false,
                titlecolor: AppTheme.greyShade700,
                subtitlecolor: AppTheme.greyShade700,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: AppTheme.greyShade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.getSize(20),
                            vertical: AppSize.getSize(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.getSize(20),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  context
                                      .l10n
                                      .popupnotificationsarenolongeravailableinyourversionofAndroid,
                                  style: TextStyle(
                                    color: AppTheme.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                                SizedBox(height: AppSize.getSize(30)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        context.l10n.learnmore,
                                        style: TextStyle(
                                          color: AppTheme.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        context.l10n.ok,
                                        style: TextStyle(
                                          color: AppTheme.greenAccentShade700,
                                          fontSize: AppSize.getSize(16),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                "Light",
                state.selectedOption,
                showSwitch: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.usehighprioritynotifications,
                context.l10n.showpreviewsofnotificationsatthetopofthescreen,
                index: 2,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.reactionsnotification,
                context.l10n.shownotificationsforreactionstomessagesyousend,
                index: 3,
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.groups,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(15),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                context,
                context.l10n.notificationtone,
               state.selectedOption,
                showSwitch: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.vibrate,
              state.selectedOption,
                showSwitch: false,
                isShow: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.light,
                state.selectedOption,
                showSwitch: false,
                isShow: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.usehighprioritynotifications,
                context.l10n.showpreviewsofnotificationsatthetopofthescreen,
                index: 4,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.reactionsnotification,
                context.l10n.shownotificationsforreactionstomessagesyousend,
                index: 5,
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.calls,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(15),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                context,
                context.l10n.ringtone,
                "Default",
                showSwitch: false,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.vibrate,
               state.selectedOption,
                showSwitch: false,
                isShow: false,
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.status,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(15),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                context,
                context.l10n.notificationtone,
               state.selectedOption,
                showSwitch: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.vibrate,
               state.selectedOption,
                showSwitch: false,
                isShow: false,
              ),

              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.usehighprioritynotifications,
                context.l10n.showpreviewsofnotificationsatthetopofthescreen,
                index: 6,
              ),
              SizedBox(height: AppSize.getSize(30)),
              radioTile(
                context,
                context.l10n.reactions,
                context.l10n.shownotificationswhenyougetlikesonastatus,
                index: 7,
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                context.l10n.homescreennotifications,
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(15),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              radioTile(
                context,
                context.l10n.clearcount,
                context
                    .l10n
                    .yourhomescreenbadgeclearscompletelyaftereverytimeyouopentheapp,
                index: 8,
              ),
            ],
          ),
        ),
      );
      }),
     
    );
  }

  void showDailogBox(
    BuildContext context,
    String title,
    List<String> options,
    String selectedValue,
    Function(String) onSelected,
    bool isShow,
  ) {
    String tempSelected = selectedValue;
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              backgroundColor: AppTheme.greyShade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...options.map((item) {
                    return dialogRadio(item, tempSelected, setStateDialog, (
                      val,
                    ) {
                      setStateDialog(() {
                        tempSelected = item;
                      });
                      onSelected(item);
                    });
                  }),

                  if (isShow)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(30)),
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "Ok",
                            style: TextStyle(
                              color: AppTheme.greenAccentShade700,
                              fontWeight: FontWeight.bold,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ),
                        SizedBox(width: AppSize.getSize(15)),
                      ],
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget dialogRadio(
    String text,
    String selectedValue,
    Function setStateDialog,
    Function(String) onSelected,
  ) {
    bool isSelected = selectedValue == text;

    return InkWell(
      onTap: () {
        onSelected(text);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.getSize(12)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.greenAccentShade700
                      : AppTheme.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.greenAccentShade700,
                        ),
                      ),
                    )
                  : null,
            ),
            SizedBox(width: AppSize.getSize(15)),
            Text(
              text,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioTile(
    BuildContext context,
    String title,
    String subtitle, {
    int? index,
    bool showSwitch = true,
    bool isShow = true,
    Color? titlecolor,
    Color? subtitlecolor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap:
          onTap ??
          () {
            if (title == "Light") {
              showDailogBox(
                context,
                title,
                [
                  "None",
                  "White",
                  "Red",
                  "Yellow",
                  "Green",
                  "Cyan",
                  "Blue",
                  "Purple",
                ],
                context.read<SettingBloc>().state.selectedOption,
                (val) {
                  context.read<SettingBloc>().add(ToggleOption(val));
                },
                isShow,
              );
            } else if (title == "Vibrate" || title == "Notification tone") {
              showDailogBox(
                context,
                title,
                ["Off", "Default", "Short", "Long"],
                context.read<SettingBloc>().state.selectedOption,
                (val) {
                  context.read<SettingBloc>().add(ToggleOption(val));
                },
                isShow,
              );
            }
          },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: titlecolor ?? AppTheme.whiteColor,
                    fontSize: AppSize.getSize(17),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: subtitlecolor ?? AppTheme.greyShade400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppSize.getSize(10)),
          if (showSwitch && index != null)
            BlocBuilder<SettingBloc, SettingState>(
              builder: (context, state) {
                return Switch(
                  value: state.selectedItems['Photos'] ?? false,
                  activeTrackColor: AppTheme.greenAccentShade700,
                  activeThumbColor: AppTheme.blackColor,
                  inactiveTrackColor: AppTheme.blackColor,
                  onChanged: (val) {
                    context.read<SettingBloc>().add(ToggleItem('Photos'));
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
