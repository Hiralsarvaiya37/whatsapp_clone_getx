import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ChatviewScreen extends StatelessWidget {
  ChatviewScreen({super.key});

  final List<String> filters = ["All", "Unread", "Favorites", "Groups", "+"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.getSize(12)),
      child: Column(
        children: [
          TextField(
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
          SizedBox(height: AppSize.getSize(6)),
          Expanded(
            child: ListView(
              children: [
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
                SizedBox(height: AppSize.getSize(20)),
                ListView.separated(
                  itemCount: 50,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.getSize(8)),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            "https://thumbs.dreamstime.com/b/two-ladybugs-orange-spring-flower-flight-insect-artistic-macro-image-concept-spring-summer-two-ladybugs-orange-125140826.jpg",
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
                                "gyssbhuhduhebehdbb",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppSize.getSize(18),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "123548856514",
                                style: TextStyle(color: AppColors.greyShade400),
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
                  separatorBuilder: (_, _) =>
                      SizedBox(height: AppSize.getSize(8)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
