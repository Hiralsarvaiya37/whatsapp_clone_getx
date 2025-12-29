import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:language_info_plus/language_info_plus.dart';
import 'package:whatsapp_clone_getx/setting/controller/setting_controller.dart';
import 'package:whatsapp_clone_getx/utils/enums/setting_option_enum.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({super.key});

  final SettingController controller = Get.put(SettingController());

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Language? selectedLanguage;
  final List<Language> allLanguages = LanguageInfoPlus.languages;
  @override
  void initState() {
    super.initState();
    selectedLanguage = LanguageInfoPlus.deviceLanguage;
  }

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
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 25),
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white, size: 25),
          SizedBox(width: 20),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.astroyogi.com/strapicmsprod/assets/peacock_feather_astrological_remedies_728x409_1_df32d89b61_5e65b3c4bb.webp",
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
                          "User account",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 7),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Busy",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => QrScreen()),
                      // );
                    },
                    child: Icon(
                      Icons.qr_code,
                      color: Colors.greenAccent.shade700,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      openAddAccountSheet(context);
                    },
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.greenAccent.shade700,
                      size: 28,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: SettingOptionEnum.values.length,
                itemBuilder: (context, index) {
                  final item = SettingOptionEnum.values[index];
                  return ListTile(
                    leading: Icon(item.iconData, color: Colors.white, size: 28),

                    title: Text(
                      item.titles,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: (item.subtitles.isNotEmpty)
                        ? Text(
                            item.subtitles,
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          )
                        : null,

                    onTap: () {
                      if (item.titles == "Account") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AccountSettingScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Privacy") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PrivacyScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Avatar") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AvatarScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Lists") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ListsScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Chats") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ChatsScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Broadcasts") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BroadcastsScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Notifications") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NotificationsScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Storage and data") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => StorageAndDataScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "Accessibility") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AccessibilityScreen(),
                        //   ),
                        // );
                      }

                      if (item.titles == "App language") {
                        openModalSheet();
                      }

                      if (item.titles == "Help and feedback") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HelpAndFeedbackScreen(),
                        //   ),
                        // );
                      }
                      if (item.titles == "Invite a friend") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => InviteFriendScreen(),
                        //   ),
                        // );
                      }
                      if (item.titles == "App updates") {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => AppUpdatesScreen(),
                        //   ),
                        // );
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 18),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade700, width: 1),
                    bottom: BorderSide(color: Colors.grey.shade700, width: 1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.all_inclusive,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Meta",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),

                    SizedBox(height: 5),
                    Text(
                      "Accounts Center",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),

                    SizedBox(height: 5),
                    Text(
                      "Control your experience across WhatsApp, Facebook, Instagram and more.",
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Text(
                "Also from Meta",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 17),
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appIcon("Meta AI App", Icons.circle_outlined),
                  appIcon("Instagram", Icons.photo_camera),
                  appIcon("Facebook", Icons.facebook),
                  appIcon("Threads", Icons.alternate_email_outlined),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appIcon(String label, IconData icon) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(icon, size: 25, color: Colors.white),
        ),
        SizedBox(height: 7),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  void openAddAccountSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.blueGrey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://madaboutdecor.co.in/cdn/shop/files/IMG_0713.heic?v=1728289287",
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Add new account",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "+26587848545",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent.shade700,
                          size: 25,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade900,
                          ),
                          child: Icon(Icons.add, color: Colors.white, size: 28),
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Add WhatsApp account",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openModalSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.97,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          size: 25,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        "App language",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: allLanguages.length,
                      itemBuilder: (context, index) {
                        final lang = allLanguages[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: radioTile(lang, setModalState),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget radioTile(Language lang, void Function(VoidCallback) setModalState) {
    bool isSelected = selectedLanguage?.code == lang.code;

    String title = lang.name;
    String? subtitle;

    if (lang.name.contains('(')) {
      final parts = lang.name.split('(');
      title = parts.first.trim();
      subtitle = '(${parts.last}';
    }

    return InkWell(
      onTap: () {
        setModalState(() {
          selectedLanguage = lang;
        });
        setState(() {});
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Colors.greenAccent.shade700 : Colors.grey,
                  width: 2,
                ),
                shape: BoxShape.circle,
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

            SizedBox(width: 25),

            Expanded(
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

                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 15,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
