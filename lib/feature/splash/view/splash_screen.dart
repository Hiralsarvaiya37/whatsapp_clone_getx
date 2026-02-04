import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/splash/provider/splash_provider.dart';
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
    Future.microtask(() {
      if (mounted) {
        Provider.of<SplashProvider>(context, listen: false).checkLogin(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
     final theme = Provider.of<AppTheme>(context, listen: false);
    AppSize.setupData(MediaQuery.of(context));
    return Scaffold(
      backgroundColor: theme.blackColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/icon/icon2.png",
                    height: AppSize.getSize(100),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "From",
            style: TextStyle(
              color: theme.greyShade400,
              fontSize: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.all_inclusive,
                size: AppSize.getSize(23),
                color: theme.whiteColor,
              ),
              SizedBox(width: AppSize.getSize(5)),
              Text(
                "Meta",
                style: TextStyle(
                  color: theme.whiteColor,
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
