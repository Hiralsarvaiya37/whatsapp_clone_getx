import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_favorites_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/unread_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ListsScreen extends StatelessWidget {
  static const id = "/ListsScreen";
  const ListsScreen({super.key});

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
        title: Text(
          "Lists",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: AppColors.greyShade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.getSize(20))),
                ),
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * AppSize.getSize(0.97),
                    color: AppColors.greyShade900,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.getSize(20),
                        vertical: AppSize.getSize(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: AppSize.getSize(6),
                              width: AppSize.getSize(45),
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(30)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.clear,
                                  size: AppSize.getSize(25),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                "Edit Lists",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(22),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.done,
                                  size: AppSize.getSize(25),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSize.getSize(30)),
                          Text(
                            "You can edit lists and filters here or reorder how they appear on the Chats tab.",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Your lists",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(20)),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Favorites",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.drag_handle,
                                size: AppSize.getSize(25),
                                color: AppColors.greyShade400,
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.getSize(30)),
                          appTitle(context, "Unread", "Preset"),
                          SizedBox(height: AppSize.getSize(30)),
                          appTitle(context, "Groups", "Preset"),
                          SizedBox(height: AppSize.getSize(30)),
                          appTitle(context, "Communities", "Preset"),
                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Available presets",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                          SizedBox(height: AppSize.getSize(20)),
                          Text(
                            "If you remove a preset list like Unread or Groups, it will become available here.",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.edit_outlined, size: AppSize.getSize(30), color: AppColors.whiteColor),
          ),
          SizedBox(width: AppSize.getSize(15)),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSize.getSize(20)),
              Icon(Icons.add, size: AppSize.getSize(70), color: AppColors.greenAccentShade700),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Any list create becomes a filter at the top of your Chats tab.",
                style: TextStyle(color: Colors.grey.shade500, fontSize: AppSize.getSize(16)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.getSize(30)),
        
              Container(
                height: AppSize.getSize(45),
                width: AppSize.getSize(300),
                decoration: BoxDecoration(
                  color: AppColors.greenshade900,
                  borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "+  Create a custom list",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(18),
                  ),
                ),
              ),
        
              SizedBox(height: AppSize.getSize(40)),
              Row(
                children: [
                  Text(
                    "Your lists",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
              appInfo("Unread", "Preset", () {
               Get.toNamed(UnreadScreen.id);
              }),
              SizedBox(height: AppSize.getSize(25)),
              appInfo("Favorites", "Add people or groups", () {
                Get.toNamed(ListFavoritesScreen.id);
              }),
              SizedBox(height: AppSize.getSize(25)),
              appInfo("Groups", "Preset", () {
                Get.toNamed(ListGroupsScreen.id);
              }),
              SizedBox(height: AppSize.getSize(25)),
              appInfo("Communities", "Preset", () {
                 Get.toNamed(ListCommunitiesScreen.id);
              }),
              SizedBox(height: AppSize.getSize(40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Available presets",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(20)),
                        Text(
                          "If you remove a preset list like Unread or Groups, it will become available here.",
                          style: TextStyle(
                            color: AppColors.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appInfo(String title, String subtitle, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appTitle(BuildContext context, String title, String subtitle) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
              SizedBox(height: AppSize.getSize(5)),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
            ],
          ),
        ),
        openDeleteDialog(context, "Delete $title?", getDeleteMessage(title)),
        SizedBox(width: AppSize.getSize(20)),
        Icon(Icons.drag_handle, size: AppSize.getSize(25), color: AppColors.greyShade400),
      ],
    );
  }

  String getDeleteMessage(String title) {
    switch (title) {
      case "Unread":
        return "Deleting this preset list will hide it from view. Your chats with people and groups won't be deleted. To add this list again, go to Lissts in Settings.";

      case "Groups":
        return "Deleting this preset list will hide it from view. Your chats with people and groups won't be deleted. To add this list again, go to Lissts in Settings.";

      case "Communities":
        return "Deleting this preset list will hide it from view. Your communities and chats with people and groups won't be deleted. To add this list again, go to Lissts in Settings.";

      default:
        return "Deleting this preset will hide it from view. Your chats will not be deleted.";
    }
  }

  Widget openDeleteDialog(BuildContext context, String title, String messsage) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: AppColors.greyShade900,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.getSize(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greyShade900,
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(27), vertical: AppSize.getSize(25)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(22)),
                      ),
                      SizedBox(height: AppSize.getSize(20)),
                      Text(
                        messsage,
                        style: TextStyle(
                          color: AppColors.greyShade400,
                          fontSize: AppSize.getSize(16),
                        ),
                      ),
                      SizedBox(height: AppSize.getSize(25)),
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
                                color: AppColors.greenAccentShade700,
                                fontSize: AppSize.getSize(16),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(width: AppSize.getSize(25)),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: AppColors.greenAccentShade700,
                                fontSize: AppSize.getSize(16),
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
      child: Icon(Icons.delete, size: AppSize.getSize(25), color: AppColors.greyShade400),
    );
  }
}
