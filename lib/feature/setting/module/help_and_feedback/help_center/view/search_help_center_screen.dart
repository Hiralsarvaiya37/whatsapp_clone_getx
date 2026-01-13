import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class SearchHelpCenterScreen extends StatelessWidget {
  static const id = "/SearchHelpCenterScreen";
  const SearchHelpCenterScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
        ),
        title: Text(
          "Help center",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppColors.whiteColor,
            ),
            color: AppColors.greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Open in browser",
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: AppSize.getSize(45),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyShade400, width: 1.5),
                  color: AppColors.greyShade900,
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: AppSize.getSize(25),
                        color: AppColors.greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Expanded(
                        child: TextField(
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: AppColors.greenAccentShade700,
                          cursorWidth: AppSize.getSize(3),
                          style: TextStyle(
                            fontSize: AppSize.getSize(16),
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Help Center",
                            hintStyle: TextStyle(color: AppColors.greyShade400),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
