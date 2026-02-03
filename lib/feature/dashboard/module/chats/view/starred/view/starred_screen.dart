import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class StarredScreen extends StatelessWidget {
  static const id = "/StarredScreen";
  const StarredScreen({super.key});

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
          "Starred",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(22),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_border_outlined,
            size: AppSize.getSize(70),
            color: context.watch<AppTheme>().greenAccentShade700,
          ),
          SizedBox(height: AppSize.getSize(30)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(90)),
            child: Text(
              "Tap and hold on any message or channel updates to star it, so you can easily find it later.",
              style: TextStyle(
                color: context.watch<AppTheme>().greyShade400,
                fontSize: AppSize.getSize(18),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
