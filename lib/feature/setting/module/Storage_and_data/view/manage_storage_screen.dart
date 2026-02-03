import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/disappearing_messages_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ManageStorageScreen extends StatelessWidget {
  static const id = "/ManageStorageScreen";
  const ManageStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Manage storage",
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
                                color: context.watch<AppTheme>().whiteColor,
                                fontSize: AppSize.getSize(25),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Used",
                              style: TextStyle(
                                color: context.watch<AppTheme>().greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: AppSize.getSize(5)),
                        Text(
                          "MB",
                          style: TextStyle(
                            color: context.watch<AppTheme>().whiteColor,
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
                              color: context.watch<AppTheme>().greyShade400,
                              fontSize: AppSize.getSize(25),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(5)),
                          Text(
                            "GB",
                            style: TextStyle(
                              color: context.watch<AppTheme>().greyShade400,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
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
                    color: context.watch<AppTheme>().whiteColor,
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
                      color: context.watch<AppTheme>().amberAccentShade100,
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
                          border: Border.all(color: context.watch<AppTheme>().whiteColor),
                          shape: BoxShape.circle,
                          color: context.watch<AppTheme>().greenColor,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(10)),
                      Text(
                        "WhatsApp (485 MB)",
                        style: TextStyle(color: context.watch<AppTheme>().greyShade400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: AppSize.getSize(10),
                        width: AppSize.getSize(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.watch<AppTheme>().whiteColor),
                          shape: BoxShape.circle,
                          color: context.watch<AppTheme>().yellowColor,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(10)),
                      Text(
                        "Other apps (39 GB)",
                        style: TextStyle(color: context.watch<AppTheme>().greyShade400),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Review and delete items",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
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
                        color: context.watch<AppTheme>().whiteColor,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ),
                  Text(
                    "80.7 MB  >",
                    style: TextStyle(
                      color: context.watch<AppTheme>().greyShade400,
                      fontSize: AppSize.getSize(16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appColor(context.watch<AppTheme>().deeppurpleColor),
                  appColor(context.watch<AppTheme>().orangeColor),
                  appColor(context.watch<AppTheme>().pinkColor),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Tools to save space",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DisappearingMessagesScreen()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.schedule_outlined,
                      size: AppSize.getSize(30),
                      color: context.watch<AppTheme>().greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(20)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Turn on disappearing messages",
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
                              fontSize: AppSize.getSize(18),
                            ),
                          ),
                          Text(
                            "Stay in control of future storage needs and build privacy into your chats.",
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
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Manage downloads",
                          style: TextStyle(
                            color: context.watch<AppTheme>().whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                        Text(
                          "Save storage by deleting app downloads you don't use.",
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
              SizedBox(height: AppSize.getSize(35)),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Chats",
                      style: TextStyle(
                        color: context.watch<AppTheme>().greyShade400,
                        fontSize: AppSize.getSize(16),
                      ),
                    ),
                  ),
                  Container(
                    height: AppSize.getSize(35),
                    width: AppSize.getSize(35),
                    decoration: BoxDecoration(
                      color: context.watch<AppTheme>().greyShade900,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search,
                      size: AppSize.getSize(20),
                      color: context.watch<AppTheme>().whiteColor,
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
                                color: context.watch<AppTheme>().whiteColor,
                                fontSize: AppSize.getSize(18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "112.9 MB",
                        style: TextStyle(
                          color: context.watch<AppTheme>().greyShade400,
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
