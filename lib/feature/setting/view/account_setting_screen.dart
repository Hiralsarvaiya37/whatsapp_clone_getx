import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/enums/account_options_enum.dart';

class AccountSettingScreen extends GetView<AccountViewController> {
  static const id = "/AccountSettingScreen";
  const AccountSettingScreen({super.key});

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
          "Account",
          style: TextStyle(
            color: AppColors.whiteColor,
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
                     controller.onTapAccountOption(AccountOptionsEnum.values[index]);
                    },

                    child: Row(
                      children: [
                        Icon(
                          AccountOptionsEnum.values[index].iconData,
                          color: AppColors.greyShade400,
                          size: AppSize.getSize(30),
                        ),
                        SizedBox(width: AppSize.getSize(20)),
                        Text(
                          AccountOptionsEnum.values[index].titles,
                          style: TextStyle(
                            color: AppColors.whiteColor,
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
