import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SearchHelpCenterScreen extends StatelessWidget {
  static const id = "/SearchHelpCenterScreen";
  const SearchHelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<AppTheme>().blackColor,
      appBar: AppBar(
        backgroundColor: context.watch<AppTheme>().blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: context.watch<AppTheme>().whiteColor,
          ),
        ),
        title: Text(
          "Help center",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: context.watch<AppTheme>().whiteColor,
            ),
            color: context.watch<AppTheme>().greyShade900,
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
                    color: context.watch<AppTheme>().whiteColor,
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
                  border: Border.all(color: context.watch<AppTheme>().greyShade400, width: 1.5),
                  color: context.watch<AppTheme>().greyShade900,
                  borderRadius: BorderRadius.circular(AppSize.getSize(25)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: AppSize.getSize(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: AppSize.getSize(25),
                        color: context.watch<AppTheme>().greyShade400,
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Expanded(
                        child: TextField(
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          cursorColor: context.watch<AppTheme>().greenAccentShade700,
                          cursorWidth: AppSize.getSize(3),
                          style: TextStyle(
                            fontSize: AppSize.getSize(16),
                            color: context.watch<AppTheme>().whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Help Center",
                            hintStyle: TextStyle(color: context.watch<AppTheme>().greyShade400),
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
