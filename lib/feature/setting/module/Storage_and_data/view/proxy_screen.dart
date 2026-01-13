import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class ProxyScreen extends StatelessWidget {
  static const id = "/ProxyScreen";
  const ProxyScreen({super.key});

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
          icon: Icon(Icons.arrow_back, size: AppSize.getSize(25), color: AppColors.whiteColor),
        ),
        title: Text(
          "Proxy",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppSize.getSize(23),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(25), vertical: AppSize.getSize(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Use proxy",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Only use a proxy if you're unable to connect to WhatsApp. Your Ip address may be visible to the proxy provider, which is not WhatsApp. ",
                    style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      color: AppColors.blueshade500,
                      fontSize: AppSize.getSize(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: AppSize.getSize(40)),
            Text(
              "Set-up proxy",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: AppSize.getSize(18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
