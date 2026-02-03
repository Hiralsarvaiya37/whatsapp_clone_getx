import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/payments/help/view/help_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  static const id = "/PaymentScreen";
  const PaymentScreen({super.key});

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
          "Payments",
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(22),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.getSize(20),
            vertical: AppSize.getSize(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: AppSize.getSize(25),
                      color: context.watch<AppTheme>().whiteColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSize.getSize(15)),
              Center(
                child: Icon(
                  Icons.content_paste_search_sharp,
                  size: AppSize.getSize(50),
                  color: context.watch<AppTheme>().greenAccentShade700,
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Text(
                "Tips for safe UPI payments from the National Payments Corporation of India.",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSize.getSize(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.77,
                    decoration: BoxDecoration(
                      border: Border.all(color: context.watch<AppTheme>().greyColor, width: 1),
                      borderRadius: BorderRadius.circular(AppSize.getSize(30)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            size: AppSize.getSize(20),
                            color: context.watch<AppTheme>().greenAccentShade700,
                          ),
                          Text(
                            "Watch video",
                            style: TextStyle(
                              color: context.watch<AppTheme>().greenAccentShade700,
                              fontSize: AppSize.getSize(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.watch<AppTheme>().greyColor, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Icon(
                        Icons.language,
                        size: AppSize.getSize(25),
                        color: context.watch<AppTheme>().greenAccentShade700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(25)),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_outlined,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().greenColor,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Send payment",
                    style: TextStyle(
                      color: context.watch<AppTheme>().whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                children: [
                  Icon(
                    Icons.qr_code,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().greenColor,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Scan any UPI QR code",
                    style: TextStyle(
                      color: context.watch<AppTheme>().whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(25)),
              Text(
                "Chat with businesses",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    appInfo("Government of And...", context.watch<AppTheme>().orangeColor,context),
                    SizedBox(width: AppSize.getSize(16)),
                    appInfo("LIC of India", context.watch<AppTheme>().deeppurpleColor,context),
                    SizedBox(width: AppSize.getSize(16)),
                    appInfo("Maha Mumbai...", context.watch<AppTheme>().pinkColor,context),
                    SizedBox(width: AppSize.getSize(16)),
                    Column(
                      children: [
                        Container(
                          height: AppSize.getSize(65),
                          width: AppSize.getSize(65),
                          decoration: BoxDecoration(
                            color: context.watch<AppTheme>().greenColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_search_sharp,
                            color: context.watch<AppTheme>().whiteColor,
                            size: AppSize.getSize(30),
                          ),
                        ),
                        SizedBox(height: AppSize.getSize(5)),
                        SizedBox(
                          width: AppSize.getSize(80),
                          child: Text(
                            "See all",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.watch<AppTheme>().whiteColor,
                              fontSize: AppSize.getSize(15),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "History",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.payment_outlined,
                        size: AppSize.getSize(60),
                        color: context.watch<AppTheme>().greyShade400,
                      ),
                      SizedBox(height: AppSize.getSize(10)),
                      Text(
                        "No payment history",
                        style: TextStyle(
                          fontSize: AppSize.getSize(16),
                          color: context.watch<AppTheme>().greyShade400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(35)),
              Text(
                "Payment methods",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(20)),
              Row(
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WhatsApp doesn't store your full bank account number, debit card or UPI PIN info.",
                          style: TextStyle(
                            color: context.watch<AppTheme>().greyShade400,
                            fontSize: AppSize.getSize(16),
                          ),
                        ),
                        Text(
                          "Learn more",
                          style: TextStyle(
                            color: context.watch<AppTheme>().blueshade500,
                            fontSize: AppSize.getSize(17),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(25)),
              Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_outlined,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().greyShade400,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Add payment method",
                    style: TextStyle(
                      color: context.watch<AppTheme>().whiteColor,
                      fontSize: AppSize.getSize(17),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              Text(
                "Account support",
                style: TextStyle(
                  color: context.watch<AppTheme>().greyShade400,
                  fontSize: AppSize.getSize(16),
                ),
              ),
              SizedBox(height: AppSize.getSize(25)),
              Row(
                children: [
                  Icon(
                    Icons.delete,
                    size: AppSize.getSize(30),
                    color: context.watch<AppTheme>().whiteColor,
                  ),
                  SizedBox(width: AppSize.getSize(20)),
                  Text(
                    "Remove payments information",
                    style: TextStyle(
                      color: context.watch<AppTheme>().greyShade700,
                      fontSize: AppSize.getSize(18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(30)),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpScreen()));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.help_outline_rounded,
                      size: AppSize.getSize(30),
                      color: context.watch<AppTheme>().greyShade400,
                    ),
                    SizedBox(width: AppSize.getSize(20)),
                    Text(
                      "Help",
                      style: TextStyle(
                        color: context.watch<AppTheme>().whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppSize.getSize(18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getSize(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UPI",
                    style: TextStyle(
                      color: context.watch<AppTheme>().whiteColor,
                      fontSize: AppSize.getSize(22),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.getSize(20)),
            ],
          ),
        ),
      ),
    );
  }

  Widget appInfo(String title, Color colors,BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: AppSize.getSize(65),
              width: AppSize.getSize(65),
              decoration: BoxDecoration(color: colors, shape: BoxShape.circle),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: context.watch<AppTheme>().blueshade500,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  size: AppSize.getSize(14),
                  color: context.watch<AppTheme>().whiteColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSize.getSize(5)),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          softWrap: true,
          style: TextStyle(
            color: context.watch<AppTheme>().whiteColor,
            fontSize: AppSize.getSize(15),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
