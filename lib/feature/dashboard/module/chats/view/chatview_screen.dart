import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/provider/chat_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chat_messages_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ChatviewScreen extends StatelessWidget {
  static const id = "/ChatviewScreen";
  ChatviewScreen({super.key});
  final List<String> filters = ["All", "Unread", "Favorites", "Groups", "+"];
  final List<String> users = List.generate(50, (index) => "User ${index + 1}");

  @override
  Widget build(BuildContext context) {
    String currentUser = "user1";
    final chatProvider = context.read<ChatProvider>();

    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSize.getSize(12)),
            child: Column(
              children: [
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: TextStyle(color: context.watch<AppTheme>().whiteColor),
                  cursorColor: context.watch<AppTheme>().greenAccentShade700,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: context.watch<AppTheme>().greyShade800,
                    prefixIcon: Icon(
                      Icons.search,
                      size: AppSize.getSize(23),
                      color: context.watch<AppTheme>().whiteColor,
                    ),
                    hintText: context.l10n.askMetaAIorSearch,
                    hintStyle: TextStyle(color: context.watch<AppTheme>().whiteColor),
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
                            color: context.watch<AppTheme>().greyShade800,
                          ),
                          child: Text(
                            filters[index],
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
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
                        padding: EdgeInsets.symmetric(
                          vertical: AppSize.getSize(8),
                        ),
                        child: InkWell(
                          onTap: () {
                            chatProvider.initChat(
                              myId: currentUser,
                              otherId: user,
                              otherName: user,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatMessagesScreen(),
                              ),
                            );
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
                                        color: context.watch<AppTheme>().whiteColor,
                                        fontSize: AppSize.getSize(18),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      context.l10n.lastmessagepreview,
                                      style: TextStyle(
                                        color: context.watch<AppTheme>().greyShade400,
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
                                    style: TextStyle(
                                      color: context.watch<AppTheme>().whiteColor,
                                    ),
                                  ),
                                  SizedBox(height: AppSize.getSize(5)),
                                  Icon(
                                    Icons.push_pin,
                                    color: context.watch<AppTheme>().whiteColor,
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
          Positioned(
            bottom: AppSize.getSize(80),
            right: AppSize.getSize(15),
            child: Container(
              decoration: BoxDecoration(
                color: context.watch<AppTheme>().greyShade800,
                borderRadius: BorderRadius.circular(AppSize.getSize(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSize.getSize(8.0)),
                child: Icon(
                  Icons.circle_outlined,
                  size: 30,
                  fontWeight: FontWeight.w600,
                  color: context.watch<AppTheme>().deeppurpleColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: AppSize.getSize(10),
            right: AppSize.getSize(6),
            child: Container(
              decoration: BoxDecoration(
                color: context.watch<AppTheme>().greenAccentShade700,
                borderRadius: BorderRadius.circular(AppSize.getSize(15)),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSize.getSize(17.0)),
                child: Icon(
                  Icons.add_comment_sharp,
                  size: AppSize.getSize(25),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
