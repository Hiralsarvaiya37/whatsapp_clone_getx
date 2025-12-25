import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/dashboard/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/dashboard/communities/view/communitiesview_screen.dart';
import 'package:whatsapp_clone_getx/dashboard/controller/dashboard_controller.dart';
import 'package:whatsapp_clone_getx/dashboard/updates/view/updateview_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final pageController = PageController();

  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Obx(
              () => dashboardController.currentIndex.value == 0
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "WhatsApp",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.qr_code, color: Colors.white, size: 30),
                            SizedBox(width: 20),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),

                            PopupMenuButton(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 30,
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SettingScreen(),
                                  //   ),
                                  // );
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("New group", 1),
                                popupTile("New community", 2),
                                popupTile("Broadcast lists", 3),
                                popupTile("Linked devices", 4),
                                popupTile("Starred", 5),
                                popupTile("Payments", 6),
                                popupTile("Read all", 7),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : dashboardController.currentIndex.value == 1
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Updates",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search, color: Colors.white, size: 30),
                            SizedBox(width: 15),
                            PopupMenuButton(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 30,
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SettingScreen(),
                                  //   ),
                                  // );
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Create channel", 1),
                                popupTile("Status privacy", 2),
                                popupTile("Starred", 3),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : dashboardController.currentIndex.value == 2
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Communities",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search, color: Colors.white, size: 30),
                            SizedBox(width: 15),
                            PopupMenuButton(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 30,
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SettingScreen(),
                                  //   ),
                                  // );
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : dashboardController.currentIndex.value == 3
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Calls",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.search, color: Colors.white, size: 30),
                            SizedBox(width: 15),
                            PopupMenuButton(
                              color: Colors.grey.shade900,
                              offset: Offset(0, 45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 30,
                              ),
                              onSelected: (value) {
                                if (value == 8) {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SettingScreen(),
                                  //   ),
                                  // );
                                }
                              },
                              itemBuilder: (context) => [
                                popupTile("Clear call log", 1),
                                popupTile("Scheduled calls", 2),
                                popupTile("Settings", 8),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ChatviewScreen(),
                  UpdateviewScreen(),
                  CommunitiesviewScreen(),
                  // CallsviewScreen(),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomOption("Chats", Icons.chat, 0),
            bottomOption("Updates", Icons.update, 1),
            bottomOption("Communities", Icons.groups_2_outlined, 2),
            bottomOption("Calls", Icons.call, 3),
          ],
        ),
      ),
    );
  }

  Widget bottomOption(String title, IconData iconData, int page) {
    return GestureDetector(
      onTap: () {
        dashboardController.changeIndex(page);

        pageController.animateToPage(
          page,
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceOut,
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 30, color: Colors.white),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem popupTile(String title, int value) {
    return PopupMenuItem(
      value: value,
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
