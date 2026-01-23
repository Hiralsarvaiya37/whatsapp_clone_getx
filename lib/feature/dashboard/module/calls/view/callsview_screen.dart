import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/favorites_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class CallsviewScreen extends StatelessWidget {
  const CallsviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSize.getSize(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                     Get.toNamed(ContactScreen.id);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.getSize(60),
                          width: AppSize.getSize(60),
                          decoration: BoxDecoration(
                            color: AppTheme.greyShade900,
                            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                          ),
                          child: Icon(
                            Icons.call,
                            size: AppSize.getSize(30),
                            color: AppTheme.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        Text(
                          context.l10n.call,
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        height: AppSize.getSize(60),
                        width: AppSize.getSize(60),
                        decoration: BoxDecoration(
                          color: AppTheme.greyShade800,
                          borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          size: AppSize.getSize(30),
                          color: AppTheme.whiteColor,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(7)),
                      Text(
                        context.l10n.schedule,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        height: AppSize.getSize(60),
                        width: AppSize.getSize(60),
                        decoration: BoxDecoration(
                          color: AppTheme.greyShade800,
                          borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                        ),
                        child: Icon(
                          Icons.keyboard_alt_sharp,
                          size: AppSize.getSize(30),
                          color: AppTheme.whiteColor,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(7)),
                      Text(
                        context.l10n.keypad,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                     Get.toNamed(FavoritesScreen.id);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.getSize(60),
                          width: AppSize.getSize(60),
                          decoration: BoxDecoration(
                            color: AppTheme.greyShade800,
                            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: AppSize.getSize(30),
                            color: AppTheme.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        Text(
                          context.l10n.favorites,
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

              SizedBox(height: AppSize.getSize(25)),

              Row(
                children: [
                  Text(
                    context.l10n.recent,
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                        height: AppSize.getSize(50),
                        width: AppSize.getSize(50),
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: AppSize.getSize(20)),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Demo",
                            style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(20)),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_outward_sharp,
                                size: AppSize.getSize(20),
                                color: AppTheme.greyShade400,
                              ),
                              SizedBox(width: AppSize.getSize(7)),
                              Text(
                               context.l10n.yesterday10_07PM,
                                style: TextStyle(
                                  color: AppTheme.greyShade400,
                                  fontSize: AppSize.getSize(16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.videocam_outlined,
                          color: AppTheme.whiteColor,
                          size: AppSize.getSize(30),
                        ),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(height: AppSize.getSize(25)),
              ),
            ],
          ),
        ),
     
        Positioned(
          bottom: AppSize.getSize(20),
          right: AppSize.getSize(0),
          child: Container(
            height: AppSize.getSize(60),
            width: AppSize.getSize(60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.getSize(15)),
              color: AppTheme.greenAccentShade700,
            ),
            child: Icon(Icons.add_call, size: AppSize.getSize(27), color: AppTheme.blackColor),
          ),
        ),
      ],
    );
  }
}
