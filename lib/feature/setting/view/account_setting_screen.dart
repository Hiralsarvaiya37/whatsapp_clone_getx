import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class AccountSettingScreen extends StatelessWidget {
  static const id = "/AccountSettingScreen";
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountProvider = context.watch<AccountViewProvider>();
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
          "Account",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.getSize(20),
          vertical: AppSize.getSize(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: AccountOptionsEnum.values.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                     accountProvider.onTapAccountOption(AccountOptionsEnum.values[index], context);
                    },

                    child: Row(
                      children: [
                        Icon(
                          AccountOptionsEnum.values[index].iconData,
                          color: context.watch<AppTheme>().greyShade400,
                          size: AppSize.getSize(30),
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Text(
                          AccountOptionsEnum.values[index].labels(context),
                          style: TextStyle(
                            color: context.watch<AppTheme>().whiteColor,
                            fontSize: AppSize.getSize(18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.getSize(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
