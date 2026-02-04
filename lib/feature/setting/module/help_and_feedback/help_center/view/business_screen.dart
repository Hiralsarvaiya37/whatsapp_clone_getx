import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/business_platform_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/business_troubleshooting.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/connecting_with_customers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/premium_features_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/selling_products_and_services.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/setting_up_an_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/widgets/common_contact_us_button.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class BusinessScreen extends StatelessWidget {
  static const id = "/BusinessScreen";
  const BusinessScreen({super.key});

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
          icon: Icon(
            Icons.arrow_back,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
        ),
        title: Text(
          "Help Center",
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            size: AppSize.getSize(25),
            color: theme.whiteColor,
          ),
          SizedBox(width: AppSize.getSize(10)),
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: AppSize.getSize(25),
              color: theme.whiteColor,
            ),
            color: theme.greyShade900,
            offset: Offset(0, AppSize.getSize(45)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.getSize(10)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  "Open in browser",
                  style: TextStyle(
                    color: theme.whiteColor,
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
                  "WhatsApp for Business",
                  style: TextStyle(
                    color: theme.greyShade400,
                    fontSize: AppSize.getSize(16),
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingUpAnAccountScreen()));
                  },
                  child: appInfo("Setting Up an Account", Icons.person_add,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnectingWithCustomersScreen()));
                  },
                  child: appInfo(
                    "Connecting with Customers",
                    Icons.group_outlined,context
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SellingProductsAndServices()));
                  },
                  child: appInfo(
                    "Selling Products and Services",
                    Icons.shopping_cart,context
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessTroubleshooting()));
                  },
                  child: appInfo("Troubleshooting", Icons.help,context),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PremiumFeaturesScreen()));
                  },
                  child: appInfo(
                    "WhatsApp Preminum Features",
                    Icons.diamond_outlined,context
                  ),
                ),
                SizedBox(height: AppSize.getSize(30)),
                InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>BusinessPlatformScreen()));
                  },
                  child: appInfo(
                    "WhatsApp Business Platform",
                    Icons.business_center,context
                  ),
                ),
              ],
            ),
          ),
          CommonContactUsButton(),
        ],
      ),
    );
  }

  Widget appInfo(String title, IconData icon, BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    return Row(
      children: [
        Icon(
          icon,
          size: AppSize.getSize(25),
          color: theme.greenAccentShade700,
        ),
        SizedBox(width: AppSize.getSize(25)),
        Text(
          title,
          style: TextStyle(
            color: theme.whiteColor,
            fontSize: AppSize.getSize(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
