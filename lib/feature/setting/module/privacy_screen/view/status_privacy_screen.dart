import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StatusPrivacyScreen extends StatelessWidget {
  static const id = "/StatusPrivacyScreen";
  const StatusPrivacyScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Status Privacy",
          style: TextStyle(
            color: AppTheme.whiteColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Who can see my status updates",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),

            radioTile("My contacts", context),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              children: [
                Expanded(child: radioTile("My contacts except...",context)),
                Text(
                  "0 excluded",
                  style: TextStyle(
                    color: AppTheme.greenAccentShade700,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              children: [
                Expanded(child: radioTile("Only share with...",context)),
                Text(
                  "25 included",
                  style: TextStyle(
                    color: AppTheme.greenAccentShade700,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(40)),

         InkWell(
                onTap: () {
                  provider.isOn = !provider.isOn;
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.cached_sharp,
                        size: AppSize.getSize(30),
                        color: AppTheme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allow Sharing",
                              style: TextStyle(
                                color: AppTheme.whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                            Text(
                              "Let pepople who can see your status reshare and forward it.",
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                ),
              ),
            
            SizedBox(height: AppSize.getSize(30)),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Share across apps",
                  style: TextStyle(
                    color: AppTheme.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Automatically share your status to your Facebook or instagram Stories.",
                              style: TextStyle(
                                color: AppTheme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                            TextSpan(
                              text: " Manage in Accounts Center",
                              style: TextStyle(
                                color: AppTheme.greenAccentShade700,
                                fontSize: AppSize.getSize(16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSize.getSize(20)),
           InkWell(
                onTap: () {
                  provider.isYes = !provider.isYes;
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(40)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.facebook,
                        size: AppSize.getSize(30),
                        color: AppTheme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Expanded(
                        child: Text(
                          "Facebook Story",
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                      ),
                      Switch(
                        value: provider.isYes,
                        activeThumbColor: AppTheme.blackColor,
                        activeTrackColor: AppTheme.greenAccentShade700,
                        inactiveTrackColor: AppTheme.blackColor,
                        onChanged: (val) {
                          provider.isYes = val;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            
            SizedBox(height: AppSize.getSize(30)),
            InkWell(
                onTap: () {
                  provider.isNo = !provider.isNo;
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(40)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.flip_to_front_rounded,
                        size: AppSize.getSize(30),
                        color: AppTheme.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Expanded(
                        child: Text(
                          "Instagram Story",
                          style: TextStyle(
                            color: AppTheme.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                      ),
                      Switch(
                        value: provider.isNo,
                        activeThumbColor: AppTheme.blackColor,
                        activeTrackColor: AppTheme.greenAccentShade700,
                        inactiveTrackColor: AppTheme.blackColor,
                        onChanged: (val) {
                          provider.isNo = val;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            

            SizedBox(height: AppSize.getSize(20)),
            Text(
              "Changes to your privacy settings won't affect status updates that you've sent already",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget radioTile(String title, BuildContext context) {
    final provider = context.read<PrivacyViewProvider>();
   
      bool isSelected = provider.selectedOption == title;
      return InkWell(
        onTap: () {
          provider.selectedOption = title;
        },
        child: Padding(
          padding: EdgeInsets.only(left: AppSize.getSize(20)),
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
                    : SizedBox(),
              ),
              SizedBox(width: AppSize.getSize(15)),

              Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(18),
                ),
              ),
            ],
          ),
        ),
      );
  
  }
}
