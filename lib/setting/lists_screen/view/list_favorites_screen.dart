import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/setting/lists_screen/controller/list_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ListFavoritesScreen extends StatelessWidget {
   ListFavoritesScreen({super.key});

 final ListViewController listController = Get.find();

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
          "Favorites",
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
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Center(
                            child: Container(
                              height: AppSize.getSize(5),
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
                                  Icons.clear_rounded,
                                  size: AppSize.getSize(25),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              Text(
                                "Edit Favorites",
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

                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Use the pencil to reorder how your lists appear in the Chats tab.",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Included",
                            style: TextStyle(
                              color: AppColors.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),

                          SizedBox(height: AppSize.getSize(20)),
                          Row(
                            children: [
                              Container(
                                height: AppSize.getSize(45),
                                width: AppSize.getSize(45),
                                decoration: BoxDecoration(
                                  color: AppColors.greenAccentShade700,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.add, size: AppSize.getSize(25)),
                              ),
                              SizedBox(width: AppSize.getSize(20)),
                              Text(
                                "Add people or groups",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "You can edit favorites here or reorder how they appear on the Calls tab.",
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
          SizedBox(width: AppSize.getSize(30)),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Use the pencil to reorder how your lists appear in the Chats tab.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                textAlign: TextAlign.center,
              ),
          
              SizedBox(height: AppSize.getSize(40)),
              Text(
                "Notifications",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Mute",
                      style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(20)),
                    ),
                  ),
                  Obx(
                   ()=> Switch(
                      value: listController.isOn.value,
                      activeThumbColor: AppColors.blackColor,
                      activeTrackColor: AppColors.greenAccentShade700,
                      inactiveTrackColor: AppColors.blackColor,
                      onChanged: (val) {
                          listController.isOn.value = val;
                        if (val == true) {
                          openMuteDialog(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Included",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(15)),
              Row(
                children: [
                  Container(
                    height: AppSize.getSize(45),
                    width: AppSize.getSize(45),
                    decoration: BoxDecoration(
                      color: AppColors.greenAccentShade700,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, size: AppSize.getSize(25)),
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Add people or groups",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(20)),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "You can edit favorites here or reorder how they appear on the Calls tab.",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      
    );
  }

  void openMuteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.greyShade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.getSize(AppSize.getSize(20))),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyShade900,
              borderRadius: BorderRadius.circular(AppSize.getSize(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(30), vertical: AppSize.getSize(20)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mute messsage notifications",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(25)),
                  ),
                  SizedBox(height: AppSize.getSize(20)),
                  Text(
                    "Other members will not see that you muted these chats, and you will still be notified if you are mentioned.",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(17)),
                  ),
                  SizedBox(height: AppSize.getSize(20)),
                  Text(
                    "Mute all chats in Favorites",
                    style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  StatefulBuilder(
                    builder: (context, setStateDialog) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appInfo("8 hours"),
                          SizedBox(height: AppSize.getSize(25)),
                          appInfo("1 week"),
                          SizedBox(height: AppSize.getSize(25)),
                          appInfo("Always"),
                          SizedBox(height: AppSize.getSize(40)),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                            listController.isOn.value = false;
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
                      SizedBox(width: AppSize.getSize(30)),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            color: AppColors.greenAccentShade700,
                            fontSize: AppSize.getSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

Widget appInfo(String title) {
  return Obx(() {
    bool isSelected =
        listController.selectedOption.value == title;

    return InkWell(
      onTap: () {
        listController.selectedOption.value = title;
      },
      child:Row(
        children: [
          Container(
            height: AppSize.getSize(22),
            width: AppSize.getSize(22),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                width: AppSize.getSize(2),
              ),
              shape: BoxShape.circle,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      height: AppSize.getSize(12),
                      width: AppSize.getSize(12),
                      decoration: BoxDecoration(
                        color: AppColors.greenAccentShade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
          SizedBox(width: AppSize.getSize(20)),
          Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(17))),
        ],
      ),
    );
  });
}

}
