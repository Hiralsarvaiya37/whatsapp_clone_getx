import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ListCommunitiesScreen extends StatelessWidget {
  static const id = "/ListCommunitiesScreen";
  const ListCommunitiesScreen({super.key});

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
          "Communities",
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
                    backgroundColor: AppColors.greyShade900,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.greyShade900,
                        borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.getSize(27),
                          vertical: AppSize.getSize(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Delete communities?",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: AppSize.getSize(22),
                              ),
                            ),
                            SizedBox(height: AppSize.getSize(10)),
                            Text(
                              "Deleting this preset list will hide it from view. Your communities and chats with people and groups won't be deleted. To add this list again, go to Lists in Settings.",
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
            child: Icon(Icons.delete, size: AppSize.getSize(25), color: AppColors.whiteColor),
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
              "This list automatically updates for you with all communities.",
              style: TextStyle(color: AppColors.greyShade400, fontSize: 16),
            ),
            SizedBox(height: AppSize.getSize(30)),
            Text(
              "Included",
              style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
            ),
            SizedBox(height: AppSize.getSize(15)),
            Row(
              children: [
                SizedBox(width: AppSize.getSize(55)),
                Text(
                  "Communities",
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
