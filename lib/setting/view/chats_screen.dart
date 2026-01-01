import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final SettingController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 25, color: Colors.white),
        ),
        title: Text(
          "Chats",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Display",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, dialogSetState) {
                          return Dialog(
                            child: Container(
                              height: 310,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Choose theme",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    radioTile(
                                      "System default",
                                      dialogSetState,
                                      chatController.selectedTheme.value,
                                    ),
                                    SizedBox(height: 30),
                                    radioTile(
                                      "Light",
                                      dialogSetState,
                                      chatController.selectedTheme.value,
                                    ),
                                    SizedBox(height: 30),
                                    radioTile(
                                      "Dark",
                                      dialogSetState,
                                      chatController.selectedTheme.value,
                                    ),

                                    SizedBox(height: 35),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                              color:
                                                  Colors.greenAccent.shade700,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 30),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                              color:
                                                  Colors.greenAccent.shade700,
                                              fontSize: 16,
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
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 30, color: Colors.grey.shade400),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Theme",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          chatController.selectedTheme.value,
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatThemeScreen()),
                  // );
                },
                child: Row(
                  children: [
                    Icon(Icons.chat, size: 30, color: Colors.grey.shade400),
                    SizedBox(width: 30),
                    Text(
                      "Default chat theme",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),
              Text(
                "Chat settings",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
              ),
              SizedBox(height: 20),
              appInfo(
                "Enter is send",
                "Enter key will send your message",
                switchValue: chatController.ison1.value,
                onChanged: (val) {
                    chatController.ison1.value = val;
                },
              ),
              SizedBox(height: 30),
              appInfo(
                "Media visibility",
                "Show newly downloaded media in your device's gallery",
                switchValue: chatController.ison2.value,
                onChanged: (val) {
                    chatController.ison2.value = val;
                },
              ),
              SizedBox(height: 30),
              appInfo(
                "Font size",
                chatController.selectedFontSize.value,
                showSwitch: false,
              ),
              SizedBox(height: 30),
              appInfo(
                "Voice message transcripts",
                "Read new voice messages.",
                showSwitch: false,
              ),
              SizedBox(height: 30),
              Text(
                "Archived chats",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
              ),
              SizedBox(height: 20),
              appInfo(
                "Keep chats archived",
                "Archived chats will remain archived when you receive a new message",
                switchValue: chatController.ison3.value,
                onChanged: (val) {
                    chatController.ison3.value = val;
                },
              ),

              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ChatBackupScreen()),
                  // );
                },
                child: chatInfo("Chat backup", Icons.backup_outlined),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => TransferChatScreen(),
                  //   ),
                  // );
                },
                child: chatInfo("Transfer chats", Icons.send_to_mobile_rounded),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ChatHistoryScreen(),
                  //   ),
                  // );
                },
                child: chatInfo("Chat history", Icons.replay_outlined),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget chatInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 30, color: Colors.grey.shade400),
        SizedBox(width: 30),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget appInfo(
    String title,
    String subtitle, {
    bool showSwitch = true,
    bool? switchValue,
    Function(bool)? onChanged,
  }) {
    return InkWell(
      onTap: () {
      if (showSwitch && onChanged != null) {
        onChanged(!(switchValue ?? false)); 
      }
    },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 55),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          if (showSwitch)
            Switch(
              value: switchValue ?? false,
              activeThumbColor: Colors.black,
              activeTrackColor: Colors.greenAccent.shade700,
              inactiveTrackColor: Colors.transparent,
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }

  Widget radioTile(
    String title,
    StateSetter dialogSetState,
    String currentSelected,
  ) {
    bool isSelected = currentSelected == title;
    return InkWell(
      onTap: () {
        dialogSetState(() {
          if (title == "Small" || title == "Medium" || title == "Large") {
            chatController.selectedFontSize.value = title;
          } else {
            chatController.selectedTheme.value = title;
          }
        });
          if (title == "Small" || title == "Medium" || title == "Large") {
            chatController.selectedFontSize.value = title;
          } else {
            chatController.selectedTheme.value = title;
          }
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.greenAccent.shade700 : Colors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade700,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            SizedBox(width: 20),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
