import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: 
         Text(
          "QR code",
          style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(23)),
        ),
        actions:  [
          Icon(Icons.share, size: AppSize.getSize(25), color: AppColors.whiteColor),
          SizedBox(width: 15),
          Icon(Icons.more_vert, size: AppSize.getSize(25), color: AppColors.whiteColor),
          SizedBox(width: 15),
        ],
        bottom: TabBar(
          controller: tabController,
          labelColor: AppColors.whiteColor,
          labelStyle: TextStyle(fontSize: AppSize.getSize(18), fontWeight: FontWeight.w600),
          unselectedLabelColor: AppColors.greyColor,
          indicator:  UnderlineTabIndicator(
            borderSide: BorderSide(width: AppSize.getSize(4.0), color: AppColors.greenColor),
            insets: EdgeInsets.symmetric(horizontal: 135),
          ),
          tabs: [
            Tab(text: "MY CODE"),
            Tab(text: "SCAN CODE"),
          ],
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.getSize(50),
                        vertical: AppSize.getSize(30),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.greyShade800,
                        borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: AppSize.getSize(25)),
                          Text(
                            "Add account",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: AppSize.getSize(20),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "WhatsApp contact",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(20)),

                          Image.network(
                            "https://www.tech-recipes.com/wp-content/uploads/2020/07/feature-image.jpg",
                            height: AppSize.getSize(200),
                            width: AppSize.getSize(200),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSize.getSize(20)),

                    Padding(
                      padding:  EdgeInsets.all(AppSize.getSize(11)),
                      child: Text(
                        "Your QR code is private. If you share it with someone, "
                        "they can scan it with their WhatsApp camera to add you as a contact.",
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: AppSize.getSize(100),
                  left: AppSize.getSize(0),
                  right: AppSize.getSize(0),
                  child: CircleAvatar(
                    radius: AppSize.getSize(30),

                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/736x/14/86/86/148686b4a830e06d8089db5cb1e521f4.jpg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: AppSize.getSize(250),
                  width: AppSize.getSize(250),
                  decoration: BoxDecoration(color: AppColors.greyShade900),
                ),
                 SizedBox(height: AppSize.getSize(20)),
                Text(
                  "Scan a WhatsApp QR code",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
