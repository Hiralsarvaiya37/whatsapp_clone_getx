import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/accounts_and_account_bans/view/account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/help_and_feedback/help_center/accounts_and_account_bans/view/accounts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class AccountsAndAccountBansScreen extends StatelessWidget {
  const AccountsAndAccountBansScreen({super.key});

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
          "Help Center",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: AppColors.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: AppColors.whiteColor,
            ),
            color: AppColors.greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: AppSize.getSize(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.getSize(20),
              vertical: AppSize.getSize(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Accounts and Account Bans",
                  style: TextStyle(
                    color: AppColors.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountsScreen(),
                      ),
                    );
                  },
                  child: appInfo("Accounts", Icons.person_2_outlined),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountBansScreen(),
                      ),
                    );
                  },
                  child: appInfo("Account Bans", Icons.do_disturb),
                ),
              ],
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.getSize(25),
          color: AppColors.greenAccentShade700,
        ),
        SizedBox(width: AppSize.getSize(25)),
        Text(
          title,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
