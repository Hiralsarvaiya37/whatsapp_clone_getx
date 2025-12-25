import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
    final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text("From",style: TextStyle(color: Colors.grey.shade500,fontSize: 16),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.all_inclusive,size: 25,color: Colors.white,),
              SizedBox(width: 5),
              Text("Meta",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)
            ],
          )
        ],
      ),
    );
  }
}
