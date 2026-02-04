import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communities_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class CommunitiesviewScreen extends StatelessWidget {
  static const id = "/CommunitiesviewScreen";
  const CommunitiesviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(20),
            ),
          ),

          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSize.getSize(18),
                      vertical: AppSize.getSize(14),
                    ),
                    decoration: BoxDecoration(
                      color: theme.greyShade400,
                      borderRadius: BorderRadius.circular(AppSize.getSize(12)),
                    ),
                    child: Icon(
                      Icons.groups_2_outlined,
                      color: theme.whiteColor,
                      size: AppSize.getSize(30),
                    ),
                  ),

                  Positioned(
                    right: AppSize.getSize(-4),
                    bottom: AppSize.getSize(-4),
                    child: Container(
                      height: AppSize.getSize(26),
                      width: AppSize.getSize(26),
                      decoration: BoxDecoration(
                        color: theme.greenAccentShade700,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: theme.blackColor,
                          width: AppSize.getSize(2),
                        ),
                      ),
                      child: Icon(
                        Icons.add,
                        size: AppSize.getSize(16),
                        color: theme.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: AppSize.getSize(20)),
              Text(
                context.l10n.newcommunity,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.getSize(30)),

          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                child: Image.network(
                  "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                  height: AppSize.getSize(60),
                  width: AppSize.getSize(60),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: AppSize.getSize(20)),
              Text(
                context.l10n.hudhhuhewnssxhwu,
                style: TextStyle(
                  color: theme.whiteColor,
                  fontSize: AppSize.getSize(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.getSize(30)),

          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.getSize(10),
                  vertical: AppSize.getSize(6),
                ),
                decoration: BoxDecoration(
                  color: theme.greenColor,
                  borderRadius: BorderRadius.circular(AppSize.getSize(12)),
                ),
                child: Icon(
                  Icons.campaign,
                  color: theme.whiteColor,
                  size: AppSize.getSize(30),
                ),
              ),
              SizedBox(width: AppSize.getSize(20)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          context.l10n.announcements,
                          style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(18),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          context.l10n.yesterday,
                          style: TextStyle(
                            color: theme.greyShade400,
                            fontSize: AppSize.getSize(16),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      context.l10n.hh15487851454hbcsdwdwdhbxhsbhsbsh,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: theme.greyShade400,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: AppSize.getSize(30)),

          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommunitiesviewScreen(),
                        ),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunitiesScreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(width: AppSize.getSize(20)),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: AppSize.getSize(20),
                            color: theme.greyShade400,
                          ),
                          SizedBox(width: AppSize.getSize(28)),
                          Text(
                            context.l10n.viewall,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: AppSize.getSize(30)),

                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppSize.getSize(10),
                        ),
                        child: Image.network(
                          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                          height: AppSize.getSize(60),
                          width: AppSize.getSize(60),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Text(
                        context.l10n.hudhhuhewnssxhwu,
                        style: TextStyle(
                          color: theme.whiteColor,
                          fontSize: AppSize.getSize(20),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.getSize(30)),

                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSize.getSize(10),
                          vertical: AppSize.getSize(7),
                        ),
                        decoration: BoxDecoration(
                          color: theme.greenColor,
                          borderRadius: BorderRadius.circular(
                            AppSize.getSize(12),
                          ),
                        ),
                        child: Icon(
                          Icons.campaign,
                          color: theme.whiteColor,
                          size: AppSize.getSize(30),
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(20)),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  context.l10n.announcements,
                                  style: TextStyle(
                                    color: theme.whiteColor,
                                    fontSize: AppSize.getSize(18),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "8/4/25",
                                  style: TextStyle(
                                    color: theme.greyShade400,
                                    fontSize: AppSize.getSize(16),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              context.l10n.hh15487851454hbcsdwdwdhbxhsbhsbsh,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: theme.greyShade400,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.getSize(30)),

                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://newsmeter.in/h-upload/2021/01/19/291251-beautiful-sakura.webp",
                          height: AppSize.getSize(55),
                          width: AppSize.getSize(55),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: AppSize.getSize(20)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.hudhhuheud,
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(20),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            context.l10n.hudhhuhewnssxhwu,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: AppSize.getSize(28)),
                ],
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: AppSize.getSize(18)),
          ),
          SizedBox(height: AppSize.getSize(18)),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=>CommunitiesScreen()));
            },
            child: Row(
              children: [
                SizedBox(width: AppSize.getSize(20)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: AppSize.getSize(18),
                  color: theme.greyShade400,
                ),
                SizedBox(width: AppSize.getSize(28)),
                Text(
                  context.l10n.viewall,
                  style: TextStyle(
                    color: theme.greyShade400,
                    fontSize: AppSize.getSize(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
