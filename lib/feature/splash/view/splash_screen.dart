import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/utils/app_size.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  static const id = "/SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      if (user != null) {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardScreen()));
      } else {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      }
    });
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
            child: Center(
              child: ClipOval(
                child: Image.network(
                  "https://static.vecteezy.com/system/resources/previews/021/495/965/non_2x/whatsapp-social-media-logo-icon-free-png.png",
                  height: AppSize.getSize(100),
                ),
              ),
            ),
          ),
          Text("From",
              style: TextStyle(color: AppTheme.greyShade400)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.all_inclusive,
                  color: AppTheme.whiteColor),
              const SizedBox(width: 5),
              Text("Meta",
                  style: TextStyle(
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
