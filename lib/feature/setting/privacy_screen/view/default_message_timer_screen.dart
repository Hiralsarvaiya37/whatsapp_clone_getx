import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/controller/privacy_view_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class DefaultMessageTimerScreen extends StatelessWidget {
   DefaultMessageTimerScreen({super.key});

  final PrivacyViewController defaultController = Get.find();

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
          "Default message timer",
          style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(23)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.getSize(20), vertical: AppSize.getSize(20)),
        child: Column(
            children: [
              Text(
                "Start new chats with a disappearing message timer set to",
                style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
              ),
              SizedBox(height: AppSize.getSize(20)),
          
              radioTile("24 hours"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("7 days"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("90 days"),
              SizedBox(height: AppSize.getSize(20)),
              radioTile("Off"),
              SizedBox(height: AppSize.getSize(20)),
          
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "When turned on, all new individual chats will start with disappearing messages set to the duration you select. This setting will not affect your existing chats. ",
                      style: TextStyle(color: AppColors.greyShade400, fontSize: AppSize.getSize(16)),
                    ),
                    TextSpan(
                      text: "Learn more",
                      style: TextStyle(
                        color: AppColors.blueshade500,
                        fontSize: AppSize.getSize(16),
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                      ..onTap = (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LearnMoreScreen()));
                      }
                    ),
                  
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }

  Widget radioTile(String title) {
   return Obx((){
     bool isSelected = defaultController.selectedOption.value == title;
    return InkWell(
      onTap: () {
     
          defaultController.selectedOption.value = title;
       
      },
      child: Padding(
        padding: EdgeInsets.only(left: AppSize.getSize(20)),
        child: Row(
          children: [
            Container(
              height: AppSize.getSize(22),
              width: AppSize.getSize(22),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppColors.greenAccentShade700 : AppColors.greyColor,
                  width: AppSize.getSize(2),
                ),
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: AppSize.getSize(12),
                        width: AppSize.getSize(12),
                        decoration: BoxDecoration(
                          color: AppColors.greenAccentShade700,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
            SizedBox(width: AppSize.getSize(20)),
            Text(title, style: TextStyle(color: AppColors.whiteColor, fontSize: AppSize.getSize(18))),
          ],
        ),
      ),
    );
   });
  }
}
