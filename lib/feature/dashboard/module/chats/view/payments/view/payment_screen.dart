import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  static const id = "/PaymentScreen";
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      appBar: AppBar(
        backgroundColor: AppTheme.blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 25, color: AppTheme.whiteColor),
        ),
        title: Text(
          "Payments",
          style: TextStyle(
            color: AppTheme.whiteColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
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
                    size: 25,
                    color: AppTheme.whiteColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Icon(
              Icons.content_paste_search_sharp,
              size: 50,
              color: AppTheme.greenAccentShade700,
            ),
            SizedBox(height: 20),
            Text(
              "Tips for safe UPI payments from the National Payments Corporation of India.",
              style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.77,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.greyColor, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 20,
                          color: AppTheme.greenAccentShade700,
                        ),
                        Text(
                          "Watch video",
                          style: TextStyle(
                            color: AppTheme.greenAccentShade700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.greyColor, width: 1),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.language,
                      size: 25,
                      color: AppTheme.greenAccentShade700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
