import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/dashboard/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';

class CallsviewScreen extends StatelessWidget {
  const CallsviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
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
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppColors.greyShade900,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.call,
                            size: 30,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "Call",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.greyShade800,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Schedule",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: AppColors.greyShade800,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.keyboard_alt_sharp,
                          size: 30,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Keypad",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => FavoritesScreen(),
                      //   ),
                      // );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: AppColors.greyShade800,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          "Favorites",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25),

              Row(
                children: [
                  Text(
                    "Recent",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => Row(
                  children: [
                    ClipOval(
                      child: Image.network(
                        "https://media.istockphoto.com/id/2162450196/photo/julia-longwing-butterfly.jpg?s=612x612&w=0&k=20&c=uvHVzWn1tLg9OJeTd4QTv1aTTu50V3b5Si1pZ9GW2yY=",
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Demo",
                            style: TextStyle(color: AppColors.whiteColor, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_outward_sharp,
                                size: 20,
                                color: AppColors.greyShade400,
                              ),
                              SizedBox(width: 7),
                              Text(
                                "Yesterday 10:07 PM",
                                style: TextStyle(
                                  color: AppColors.greyShade400,
                                  fontSize: 16,
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
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ],
          ),
        ),
     
        Positioned(
          bottom: 20,
          right: 0,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.greenAccentShade700,
            ),
            child: Icon(Icons.add_call, size: 27, color: AppColors.blackColor),
          ),
        ),
      ],
    );
  }
}
