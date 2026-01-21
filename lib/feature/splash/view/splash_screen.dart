import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:whatsapp_clone_getx/feature/splash/controller/splash_controller.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());

  @override
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.setupData(MediaQuery.of(context));
    return Scaffold(
      backgroundColor: AppTheme.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    "https://static.vecteezy.com/system/resources/previews/021/495/965/non_2x/whatsapp-social-media-logo-icon-free-png.png",
                    height: AppSize.getSize(100),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "From",
            style: TextStyle(color: AppTheme.greyShade400, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.all_inclusive,
                size: AppSize.getSize(23),
                color: AppTheme.whiteColor,
              ),
              SizedBox(width: AppSize.getSize(5)),
              Text(
                "Meta",
                style: TextStyle(
                  color: AppTheme.whiteColor,
                  fontSize: AppSize.getSize(20),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
