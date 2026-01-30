import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class LastseenAndOnlineScreen extends StatelessWidget {
  static const id = "/LastseenAndOnlineScreen";
 const LastseenAndOnlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final provider = context.watch<PrivacyViewProvider>();
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
          "Last seen and online",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Who can see my last seen",
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),

             radioTile("Everyone", provider.selectedLastSeen, (
                  value,
                ) {
                  provider.selectedLastSeen = value;
                }),
              

           radioTile(
                  "My contacts",
                  provider.selectedLastSeen,
                  (value) {
                    provider.selectedLastSeen = value;
                  },
                ),
              

            radioTile(
                  "My contacts except...",
                  provider.selectedLastSeen,
                  (value) {
                    provider.selectedLastSeen = value;
                  },
                ),
              

             radioTile("Nobody", provider.selectedLastSeen, (
                  value,
                ) {
                  provider.selectedLastSeen = value;
                }),
              

              SizedBox(height: AppSize.getSize(40)),
              Text(
                "Who can see when I'm online",
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(15)),

           radioTile("Everyone", provider.selectedOnline, (
                  value,
                ) {
                  provider.selectedOnline = value;
                }),
              

           radioTile(
                  "Same as last seen",
                  provider.selectedOnline,
                  (value) {
                    provider.selectedOnline = value;
                  },
                ),
              

              SizedBox(height: AppSize.getSize(20)),
              Text(
                "If you don't share when you were last seen or online, you won't be able to see when other people were last seen or online.",
                style: TextStyle(
                  color: AppTheme.greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(
    String title,
    String selectedValue,
    Function(String) onSelect,
  ) {
    bool isSelected = selectedValue == title;

    return InkWell(
      onTap: () => onSelect(title),
      child: Padding(
        padding: EdgeInsets.only(
          top: AppSize.getSize(10),
          bottom: AppSize.getSize(10),
          left: AppSize.getSize(20),
        ),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.greenAccentShade700
                      : AppTheme.greyColor,
                  width: AppSize.getSize(2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.greenAccentShade700,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),

            SizedBox(width: AppSize.getSize(15)),
            Text(
              title,
              style: TextStyle(
                color: AppTheme.whiteColor,
                fontSize: AppSize.getSize(18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
