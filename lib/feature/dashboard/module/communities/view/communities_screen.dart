import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

// void main() => runApp(MaterialApp(home: CommunitiesScreen()));

class CommunitiesScreen extends StatelessWidget {
  static const id  = "/CommunitiesScreen";
  const CommunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: AppSize.getSize(200),
            collapsedHeight: AppSize.getSize(120),
            backgroundColor: AppTheme.blackColor,
            automaticallyImplyLeading: false,
            toolbarHeight: AppSize.getSize(0),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double currentHeight = constraints.maxHeight;

                bool isCollapsed = currentHeight <= AppSize.getSize(115);

                return AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.only(
                    top: AppSize.getSize(30),
                    left: AppSize.getSize(20),
                    right: AppSize.getSize(20),
                    bottom: AppSize.getSize(20),
                  ),
                  alignment: Alignment.topLeft,
                  child: isCollapsed
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(25),
                              ),
                            ),
                            SizedBox(width: AppSize.getSize(12)),

                            Expanded(
                              child: Row(
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
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          context.l10n.hSSCGroup,
                                          style: TextStyle(
                                            color: AppTheme.whiteColor,
                                            fontSize: AppSize.getSize(18),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                         context.l10n.requesttojoin,
                                          style: TextStyle(
                                            color: AppTheme.greyColor,
                                            fontSize: AppSize.getSize(16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: AppTheme.whiteColor,
                                size: AppSize.getSize(25),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnkG8PXrO8O3U7mwOSRcm9lUdwuWpwvXMvaQ&s",
                                    height: AppSize.getSize(55),
                                    width: AppSize.getSize(55),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: AppSize.getSize(20)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "HSSC Group ${2022}",
                                        style: TextStyle(
                                          color: AppTheme.whiteColor,
                                          fontSize: AppSize.getSize(18),
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        context.l10n.requesttojoin,
                                        style: TextStyle(
                                          color: AppTheme.greyColor,
                                          fontSize: AppSize.getSize(16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xFF00A884),
                      borderRadius: BorderRadius.all(Radius.circular(AppSize.getSize(12))),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(8), vertical: AppSize.getSize(5)),
                      child: Icon(
                        Icons.campaign,
                        color: AppTheme.whiteColor,
                        size: AppSize.getSize(30),
                      ),
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
                                color: AppTheme.whiteColor,
                                fontSize: AppSize.getSize(18),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              context.l10n.yesterday,
                              style: TextStyle(
                                color: AppTheme.greyColor,
                                fontSize: AppSize.getSize(16),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          context.l10n.hh15487851454hbcsdwdwdhbxhsbhsbsh,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppTheme.greyColor, fontSize: AppSize.getSize(16)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(10)),
              child: Text(
                context.l10n.groupsyoucanjoin,
                style: TextStyle(color: AppTheme.greyColor, fontSize: AppSize.getSize(17)),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(18), vertical: AppSize.getSize(10)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.getSize(48)),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnkG8PXrO8O3U7mwOSRcm9lUdwuWpwvXMvaQ&s",
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
                            context.l10n.hSSCGroup2022,
                            style: TextStyle(
                              color: AppTheme.whiteColor,
                              fontSize: AppSize.getSize(18),
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            context.l10n.requesttojoin,
                            style: TextStyle(color: AppTheme.greyColor, fontSize: AppSize.getSize(16)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              childCount: 8,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: AppTheme.blackColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(10), vertical: AppSize.getSize(11)),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF00A884),
              borderRadius: BorderRadius.all(Radius.circular(AppSize.getSize(30))),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: AppTheme.blackColor, size: AppSize.getSize(25)),
                SizedBox(width: AppSize.getSize(10)),
                Text(
                 context.l10n.addgroup,
                  style: TextStyle(
                    color: AppTheme.blackColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommunityHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => AppSize.getSize(90);
  @override
  double get maxExtent => AppSize.getSize(180);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    final double imageSize = lerpDouble(60, 36, progress)!;
    final double titleFontSize = lerpDouble(22, 18, progress)!;

    return Container(
      color: AppTheme.blackColor,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: progress > 0.8 ? 10 : 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(lerpDouble(10, 8, progress)!),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnkG8PXrO8O3U7mwOSRcm9lUdwuWpwvXMvaQ&s",
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: AppSize.getSize(16)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.l10n.haryanaGovtJobs2025,
                  style: TextStyle(
                    color: AppTheme.whiteColor,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Opacity(
                  opacity: 1 - progress,
                  child: Text(
                    context.l10n.community_5groups,
                    style: TextStyle(color: AppTheme.whiteColor, fontSize: AppSize.getSize(16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
