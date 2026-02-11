import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/provider/login_provider.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/provider/otp_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/provider/call_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/provider/chat_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/provider/updateview_provider.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/provider/dashboard_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/provider/account_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/provider/accessibility_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/provider/chat_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/provider/help_and_feedback_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/provider/list_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/provider/privacy_view_provider.dart';
import 'package:whatsapp_clone_getx/feature/setting/provider/setting_provider.dart';
import 'package:whatsapp_clone_getx/feature/splash/provider/splash_provider.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';
import 'package:whatsapp_clone_getx/l10n/app_localizations.dart';
import 'package:whatsapp_clone_getx/utils/app_router.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';
import 'package:whatsapp_clone_getx/utils/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProxyProvider<LoginProvider, OtpProvider>(
          create: (_) => OtpProvider(LoginProvider()),
          update: (_, loginProvider, otpProvider) => OtpProvider(loginProvider),
        ),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => UpdateviewProvider()),
        ChangeNotifierProvider(create: (_) => CallProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
        ChangeNotifierProvider(
          create: (context) => PrivacyViewProvider(
            settingController: context.read<SettingProvider>(),
          ),
        ),
        ChangeNotifierProvider(create: (_)=>ListViewProvider()),
        ChangeNotifierProvider(create: (_)=>ChatViewProvider()),
        ChangeNotifierProvider(create: (_)=>AccessibilityViewProvider()),
        ChangeNotifierProvider(create: (_)=>HelpAndFeedbackViewProvider()),
        ChangeNotifierProvider(create: (_)=>AccountViewProvider()),
        ChangeNotifierProvider(create: (_)=>AppTheme()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingProvider = context.watch<SettingProvider>();
    return MaterialApp(
      // initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen.id,
      locale: Locale(settingProvider.selectedLanguage.code),
      routes: AppRouter.routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: child ?? SizedBox(),
        );
      },
    );
  }
}
