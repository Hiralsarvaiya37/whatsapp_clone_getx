import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class BroadcastsScreen extends StatelessWidget {
  static const id = "/BroadcastsScreen";
  const BroadcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Scaffold(
      backgroundColor: theme.blackColor,
      appBar: AppBar(
        backgroundColor: theme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: theme.whiteColor),
        ),
        title: Text(
          context.l10n.broadcasts,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        context.l10n.thismonth,
                        style: TextStyle(
                          color: theme.whiteColor,
                          fontSize: AppSize.getSize(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "01 Dec- 31 Dec",
                      style: TextStyle(
                        color: theme.whiteColor,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.getSize(25)),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              color: theme.whiteColor,
                              fontSize: AppSize.getSize(16),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            context.l10n.sent,
                            style: TextStyle(
                              color: theme.greyShade400,
                              fontSize: AppSize.getSize(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "35",
                          style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          context.l10n.remaining,
                          style: TextStyle(
                            color: theme.greyShade400,
                            fontSize: AppSize.getSize(14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppSize.getSize(15)),
                Container(
                  height: AppSize.getSize(10),
                  decoration: BoxDecoration(
                    color: theme.greyShade800,
                    borderRadius: BorderRadius.circular(AppSize.getSize(20)),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: context.l10n.sendupto35broadcastsmonth,
                            style: TextStyle(color: theme.greyShade400),
                          ),
                          TextSpan(
                            text: context.l10n.learnmore,
                            style: TextStyle(
                              color: theme.greenAccentShade700,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));

                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.nobroadcasts,
                          style: TextStyle(
                            color: theme.whiteColor,
                            fontSize: AppSize.getSize(16),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: AppSize.getSize(20),
            right: AppSize.getSize(20),
            child: InkWell(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
              },
              child: Container(
                height: AppSize.getSize(55),
                width: AppSize.getSize(55),
                decoration: BoxDecoration(
                  color: theme.greenAccentShade700,
                  borderRadius: BorderRadius.circular(AppSize.getSize(10)),
                ),
                child: Icon(Icons.add, size: AppSize.getSize(25)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
