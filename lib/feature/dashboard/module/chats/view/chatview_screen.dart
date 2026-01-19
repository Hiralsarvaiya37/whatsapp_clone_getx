import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/controller/chat_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chat_messages_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatviewScreen extends StatelessWidget {
  static const id = "/ChatviewScreen";
  ChatviewScreen({super.key});

  final List<String> filters = ["All", "Unread", "Favorites", "Groups", "+"];
  final List<String> users = List.generate(50, (index) => "User ${index + 1}");

  @override
  Widget build(BuildContext context) {
    String currentUser = "user1";

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSize.getSize(12)),
        child: Column(
          children: [
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              style: TextStyle(color: AppColors.whiteColor),
              cursorColor: AppColors.greenAccentShade700,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: AppColors.greyShade800,
                prefixIcon: Icon(
                  Icons.search,
                  size: AppSize.getSize(23),
                  color: AppColors.greyShade400,
                ),
                hintText: "Ask Meta AI or Search",
                hintStyle: TextStyle(color: AppColors.greyShade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: AppSize.getSize(22)),

            SizedBox(
              height: AppSize.getSize(42),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: AppSize.getSize(10)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.getSize(20),
                        vertical: AppSize.getSize(9),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(30),
                        ),
                        color: AppColors.greyShade800,
                      ),
                      child: Text(
                        filters[index],
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemCount: users.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (_, _) =>
                    SizedBox(height: AppSize.getSize(8)),
                itemBuilder: (context, index) {
                  String user = users[index];
                  if (user == currentUser) return SizedBox();

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.getSize(8)),
                    child: InkWell(
                      onTap: () {
                        final chatController = Get.find<ChatController>();
                        chatController.initChat(
                          myId: currentUser,
                          otherId: user,
                          otherName: user,
                        );

                        Get.toNamed(ChatMessagesScreen.id);
                      },
                      child: Row(
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
                                  user,
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Last message preview",
                                  style: TextStyle(
                                    color: AppColors.greyShade400,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "11:11",
                                style: TextStyle(color: AppColors.whiteColor),
                              ),
                              SizedBox(height: 5),
                              Icon(
                                Icons.push_pin,
                                color: AppColors.whiteColor,
                                size: AppSize.getSize(18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
