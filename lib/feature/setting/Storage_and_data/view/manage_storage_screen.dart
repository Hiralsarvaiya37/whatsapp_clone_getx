import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/Storage_and_data/view/disappearing_messages_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ManageStorageScreen extends StatelessWidget {
  const ManageStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Manage storage",
          style: TextStyle(
            color: AppColors.whiteColor,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "463",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(25),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Used",
                              style: TextStyle(
                                color: AppColors.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSize.getSize(5)),
                        Text(
                          "MB",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(25),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(5)),
                          Text(
                            "GB",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(20)),
              Container(
                height: AppSize.getSize(16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.whiteColor,
                    width: AppSize.getSize(1),
                  ),
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width:
                        MediaQuery.of(context).size.width *
                        AppSize.getSize(0.7),
                    decoration: BoxDecoration(
                      color: AppColors.amberAccentShade100,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(AppSize.getSize(20)),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        height: AppSize.getSize(10),
                        width: AppSize.getSize(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.whiteColor),
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(10)),
                      Text(
                        "WhatsApp (485 MB)",
                        style: TextStyle(color: AppColors.greyShade400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: AppSize.getSize(10),
                        width: AppSize.getSize(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.whiteColor),
                          shape: BoxShape.circle,
                          color: AppColors.yellowColor,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(10)),
                      Text(
                        "Other apps (39 GB)",
                        style: TextStyle(color: AppColors.greyShade400),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Review and delete items",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Larger than 5 MB",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                  Text(
                    "80.7 MB  >",
                    style: TextStyle(
                      color: AppColors.greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appColor(AppColors.deeppurpleColor),
                  appColor(AppColors.orangeColor),
                  appColor(AppColors.pinkColor),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Tools to save space",
                style: TextStyle(
                  color: AppColors.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DisappearingMessagesScreen(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: AppSize.getSize(30),
                      color: AppColors.greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(20)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Turn on disappearing messages",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          Text(
                            "Stay in control of future storage needs and build privacy into your chats.",
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
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: AppSize.getSize(30),
                    color: AppColors.greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manage downloads",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        Text(
                          "Save storage by deleting app downloads you don't use.",
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
              SizedBox(height: AppSize.getSize(35)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Chats",
                      style: TextStyle(
                        color: AppColors.greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ),
                  Container(
                    height: AppSize.getSize(35),
                    width: AppSize.getSize(35),
                    decoration: BoxDecoration(
                      color: AppColors.greyShade900,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search,
                      size: AppSize.getSize(20),
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg",
                                width: AppSize.getSize(45),
                                height: AppSize.getSize(45),
                                fit: BoxFit.cover,
                              ),
                            ),

                            SizedBox(width: AppSize.getSize(20)),
                            Text(
                              "User",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "112.9 MB",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.getSize(20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appColor(Color color) {
    return Container(
      height: AppSize.getSize(120),
      width: AppSize.getSize(100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.getSize(10)),
        color: color,
      ),
    );
  }
}
