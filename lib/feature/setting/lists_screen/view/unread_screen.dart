import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class UnreadScreen extends StatelessWidget {
  const UnreadScreen({super.key});

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
          "Unread",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                    ),
                    child: Container(

                      decoration: BoxDecoration(
                        color: AppColors.greyShade900,
                        borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.getSize(26),
                          vertical: AppSize.getSize(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delete Unread?",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(22),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(15)),
                            Text(
                              "Deleting this preset list will hide it from view. Your chats with people and groups won't be deleted. To add this list again, go to Lists in Settings.",
                              style: TextStyle(
                                color: AppColors.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(30)),
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
                                SizedBox(width: AppSize.getSize(30)),
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
            child: Icon(Icons.delete, color: AppColors.whiteColor, size: AppSize.getSize(25)),
          ),
          SizedBox(width: AppSize.getSize(15)),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This list automatically updates for you with all chats with inread messages.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSize.getSize(40)),
            Text(
              "Included",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(20)),
            Row(
              children: [
                Container(
                  height: AppSize.getSize(45),
                  width: AppSize.getSize(45),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greyColor,
                  ),
                  child: Icon(
                    Icons.add_chart_sharp,
                    size: AppSize.getSize(25),
                  ),
                ),
                SizedBox(width: AppSize.getSize(20)),
                Text(
                  "Unread chats",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
