import 'package:flutter/material.dart';
// import 'package:whatsapp_clone/dashboard/view/calls/callsview_screen.dart';
// import 'package:whatsapp_clone/dashboard/view/chats/chatview_screen.dart';
// import 'package:whatsapp_clone/dashboard/view/communities/communitiesview_screen.dart';
// import 'package:whatsapp_clone/dashboard/settings/setting_screen.dart';
// import 'package:whatsapp_clone/dashboard/view/updates/updateview_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: currentIndex == 0
          ? AppBar(
              title: Text(
                "WhatsApp",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Icon(Icons.qr_code, color: Colors.white, size: 30),
                SizedBox(width: 20),
                Icon(Icons.camera_alt_outlined, color: Colors.white, size: 30),
                SizedBox(width: 10),

                SizedBox(
                  width: 55,
                  child: PopupMenuButton(
                    color: Colors.grey.shade900,
                    offset: Offset(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
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
                ),
               
              ],
              backgroundColor: Colors.black,
            )
          : currentIndex == 1
          ? AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "Updates",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Icon(Icons.search, color: Colors.white, size: 30),
                SizedBox(width: 20),
                SizedBox(
                  width: 55,
                  child: PopupMenuButton(
                    color: Colors.grey.shade900,
                    offset: Offset(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
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
                ),
              ],
            )
          : currentIndex == 2
          ? AppBar(
              title: Text(
                "Communities",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Icon(Icons.search, color: Colors.white, size: 30),
                SizedBox(width: 20),
                SizedBox(
                  width: 55,
                  child: PopupMenuButton(
                    color: Colors.grey.shade900,
                    offset: Offset(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
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
                    itemBuilder: (context) => [popupTile("Settings", 8)],
                  ),
                ),
              ],
              backgroundColor: Colors.black,
            )
          : AppBar(
              title: Text(
                "Calls",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                Icon(Icons.search, color: Colors.white, size: 30),
                SizedBox(width: 20),
                SizedBox(
                  width: 50,
                  child: PopupMenuButton(
                    color: Colors.grey.shade900,
                    offset: Offset(0, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
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
                ),
              ],
              backgroundColor: Colors.black,
            ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 5),

            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // ChatviewScreen(),
                  // UpdateviewScreen(),
                  // CommunitiesviewScreen(),
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
        setState(() {
          currentIndex = page;
        });
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
