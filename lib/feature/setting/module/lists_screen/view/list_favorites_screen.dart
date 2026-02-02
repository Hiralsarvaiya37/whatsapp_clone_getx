import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/provider/list_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class ListFavoritesScreen extends StatelessWidget {
  static const id = "/ListFavoritesScreen";
  const ListFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listProvider = context.watch<ListViewProvider>();
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppTheme.whiteColor,
          ),
        ),
        title: Text(
          "Favorites",
          style: TextStyle(
            color: AppTheme.whiteColor,
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
                backgroundColor: AppTheme.greyShade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppSize.getSize(20)),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height:
                        MediaQuery.of(context).size.height *
                        AppSize.getSize(0.97),
                    color: AppTheme.greyShade900,
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
                                color: AppTheme.greyColor,
                                borderRadius: BorderRadius.circular(
                                  AppSize.getSize(30),
                                ),
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
                                  color: AppTheme.whiteColor,
                                ),
                              ),
                              Text(
                                "Edit Favorites",
                                style: TextStyle(
                                  color: AppTheme.whiteColor,
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
                                  color: AppTheme.whiteColor,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Use the pencil to reorder how your lists appear in the Chats tab.",
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "Included",
                            style: TextStyle(
                              color: AppTheme.greyShade400,
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
                                  color: AppTheme.greenAccentShade700,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: AppSize.getSize(25),
                                ),
                              ),
                              SizedBox(width: AppSize.getSize(20)),
                              Text(
                                "Add people or groups",
                                style: TextStyle(
                                  color: AppTheme.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSize.getSize(40)),
                          Text(
                            "You can edit favorites here or reorder how they appear on the Calls tab.",
                            style: TextStyle(
                              color: AppTheme.greyShade400,
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
            child: Icon(
              Icons.edit_outlined,
              size: AppSize.getSize(30),
              color: AppTheme.whiteColor,
            ),
          ),
          SizedBox(width: AppSize.getSize(30)),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Use the pencil to reorder how your lists appear in the Chats tab.",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: AppSize.getSize(40)),
            Text(
              "Notifications",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Mute",
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(20),
                    ),
                  ),
                ),
                Switch(
                  value: listProvider.isOn,
                  activeThumbColor: AppTheme.blackColor,
                  activeTrackColor: AppTheme.greenAccentShade700,
                  inactiveTrackColor: AppTheme.blackColor,
                  onChanged: (val) {
                    listProvider.setSwitch(val);
                    if (val) {
                      openMuteDialog(context);
                    }
                  },
                ),
              ],
            ),

            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Included",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Row(
              children: [
                Container(
                  height: AppSize.getSize(45),
                  width: AppSize.getSize(45),
                  decoration: BoxDecoration(
                    color: AppTheme.greenAccentShade700,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, size: AppSize.getSize(25)),
                ),
                SizedBox(width: AppSize.getSize(20)),
                Text(
                  "Add people or groups",
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: AppSize.getSize(20),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "You can edit favorites here or reorder how they appear on the Calls tab.",
              style: TextStyle(
                color: AppTheme.greyShade400,
                fontSize: AppSize.getSize(16),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void openMuteDialog(BuildContext context) {
    final listProvider = context.read<ListViewProvider>();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppTheme.greyShade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.getSize(AppSize.getSize(20)),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.greyShade900,
              borderRadius: BorderRadius.circular(AppSize.getSize(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getSize(30),
                vertical: AppSize.getSize(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mute messsage notifications",
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(25),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(20)),
                  Text(
                    "Other members will not see that you muted these chats, and you will still be notified if you are mentioned.",
                    style: TextStyle(
                      color: AppTheme.greyShade400,
                      fontSize: AppSize.getSize(17),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(20)),
                  Text(
                    "Mute all chats in Favorites",
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                  SizedBox(height: AppSize.getSize(30)),
                  StatefulBuilder(
                    builder: (context, setStateDialog) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appInfo("8 hours", context),
                          SizedBox(height: AppSize.getSize(25)),
                          appInfo("1 week", context),
                          SizedBox(height: AppSize.getSize(25)),
                          appInfo("Always", context),
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
                          listProvider.setSwitch(false);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: AppTheme.greenAccentShade700,
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
                            color: AppTheme.greenAccentShade700,
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

  Widget appInfo(String title, BuildContext context) {
    return Consumer<ListViewProvider>(
      builder: (context, listProvider, _) {
        bool isSelected = listProvider.selectedOption == title;

        return InkWell(
          onTap: () {
            listProvider.setOption(title);
          },
          child: Row(
            children: [
              Container(
                height: AppSize.getSize(22),
                width: AppSize.getSize(22),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.greenAccentShade700
                        : AppTheme.greyColor,
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
                            color: AppTheme.greenAccentShade700,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              SizedBox(width: AppSize.getSize(20)),
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(17),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
