import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';

class SplashProvider extends ChangeNotifier {
  void checkLogin(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.pushReplacementNamed(context, DashboardScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
    });
  }
}
