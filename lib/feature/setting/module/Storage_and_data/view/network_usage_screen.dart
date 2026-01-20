import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class NetworkUsageScreen extends StatelessWidget {
  static const id = "/NetworkUsageScreen";
 const  NetworkUsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppTheme.whiteColor),
        ),
        title: Text(
          "Network usage",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: AppSize.getSize(40)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Usage",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "790.3 ",
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(25),
                          ),
                        ),
                        Text(
                          "MB",
                          style: TextStyle(
                            color: AppTheme.greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: AppSize.getSize(15),
                            color: AppTheme.greyShade400,
                          ),
                          Text(
                            " Sent",
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "77.6 MB",
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: AppSize.getSize(15),
                            color: AppTheme.greyShade400,
                          ),
                          Text(
                            " Received",
                            style: TextStyle(
                              color: AppTheme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "712.8 MB",
                        style: TextStyle(
                          color: AppTheme.whiteColor,
                          fontSize: AppSize.getSize(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(40)),
              appTile(
                context,
                "Calls",
                Icons.call_outlined,
                " 68.9 MB",
                " 109.0 MB",
                isShow: true,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0.2),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context,
                "Media",
                Icons.collections_outlined,
                " 3.1 MB",
                " 285.4 MB",
                isShow: false,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0.3),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context,
                "Google storage",
                Icons.wb_cloudy_outlined,
                " 0.5 kB",
                " 0.8 kB",
                isShow: false,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context,
                "Messages",
                Icons.message_sharp,
                " 4.8 MB",
                " 10.7 MB",
                isShow: true,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0.02),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context,
                "Status",
                Icons.data_saver_off,
                " 718 kB",
                " 308.0 MB",
                isShow: true,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0.3),
              ),
              SizedBox(height: AppSize.getSize(30)),
              appTile(
                context,
                "Roaming",
                Icons.language,
                " 0 kB",
                " 0 kB",
                isShow: false,
                width: MediaQuery.of(context).size.width * AppSize.getSize(0),
              ),

              SizedBox(height: AppSize.getSize(40)),
              Padding(
                padding: EdgeInsets.only(left: AppSize.getSize(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reset statistics",
                      style: TextStyle(
                        color: AppTheme.whiteColor,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Last reset time: Never",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget appTile(
    BuildContext context,
    String title,
    IconData icon,
    String subtitle,
    String thirdtitle, {
    bool isShow = false,
    required double width,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppSize.getSize(30), color: AppTheme.greyShade400),
        SizedBox(width: AppSize.getSize(20)),

        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontSize: AppSize.getSize(17),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: AppSize.getSize(15),
                        color: AppTheme.greyShade400,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(15),
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(15)),
                      Icon(
                        Icons.arrow_downward,
                        size: AppSize.getSize(15),
                        color: AppTheme.greyShade400,
                      ),
                      Text(
                        thirdtitle,
                        style: TextStyle(
                          color: AppTheme.greyShade400,
                          fontSize: AppSize.getSize(15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(8)),
              Container(
                height: AppSize.getSize(5),
                decoration: BoxDecoration(
                  color: AppTheme.greyShade900,
                  borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: AppTheme.greenAccentShade700,
                      borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSize.getSize(8)),
              if (isShow)
                Row(
                  children: [
                    Text(
                      "4 outgoing • 6 incoming",
                      style: TextStyle(
                        color: AppTheme.greyShade400,
                        fontSize: AppSize.getSize(14),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
