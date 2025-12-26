import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/splash/controller/splash_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_colors.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
    final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
       AppSize.setupData(MediaQuery.of(context));
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    "https://static.vecteezy.com/system/resources/thumbnails/019/874/364/small/whatsapp-apps-icon-free-png.png",
                    height: AppSize.getSize(100),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text("From",style: TextStyle(color:AppColors.greyShade400,fontSize: 16),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.all_inclusive,size: AppSize.getSize(23),color: AppColors.whiteColor,),
              SizedBox(width: AppSize.getSize(5)),
              Text("Meta",style: TextStyle(color: AppColors.whiteColor,fontSize: AppSize.getSize(20),fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
