import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/favorites_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactScreen(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.getSize(60),
                          width: AppSize.getSize(60),
                          decoration: BoxDecoration(
                            color: AppColors.greyShade900,
                            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                          ),
                          child: Icon(
                            Icons.call,
                            size: AppSize.getSize(30),
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        Text(
                          "Call",
                          style: TextStyle(
                            color: AppColors.greyShade400,
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
                          color: AppColors.greyShade800,
                          borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          size: AppSize.getSize(30),
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(7)),
                      Text(
                        "Schedule",
                        style: TextStyle(
                          color: AppColors.greyShade400,
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
                          color: AppColors.greyShade800,
                          borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                        ),
                        child: Icon(
                          Icons.keyboard_alt_sharp,
                          size: AppSize.getSize(30),
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(7)),
                      Text(
                        "Keypad",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: AppSize.getSize(60),
                          width: AppSize.getSize(60),
                          decoration: BoxDecoration(
                            color: AppColors.greyShade800,
                            borderRadius: BorderRadius.circular(AppSize.getSize(50)),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: AppSize.getSize(30),
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(7)),
                        Text(
                          "Favorites",
                          style: TextStyle(
                            color: AppColors.greyShade400,
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
                    "Recent",
                    style: TextStyle(
                      color: AppColors.whiteColor,
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
                            style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(20)),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_outward_sharp,
                                size: AppSize.getSize(20),
                                color: AppColors.greyShade400,
                              ),
                              SizedBox(width: AppSize.getSize(7)),
                              Text(
                                "Yesterday 10:07 PM",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
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
                          color: AppColors.whiteColor,
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
              color: AppColors.greenAccentShade700,
            ),
            child: Icon(Icons.add_call, size: AppSize.getSize(27), color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }
}
