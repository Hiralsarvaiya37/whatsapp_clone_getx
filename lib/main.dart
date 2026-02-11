import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/bloc/dashboard_cubit.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/bloc/chat_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/bloc/accessibility_bloc.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';
import 'package:whatsapp_clone_getx/l10n/app_localizations.dart';
import 'package:whatsapp_clone_getx/utils/app_router.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';
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
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashboardCubit()),
        BlocProvider(create: (_) => ChatBloc()),
        BlocProvider(create: (_) => UpdateBloc()),
        BlocProvider(create: (_) => StatusBloc()),
        BlocProvider(create: (_) => CallBloc()),
        BlocProvider(create: (_) => SettingBloc()..add(LoadProfilePic())),
        BlocProvider(create: (_) => AccessibilityBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: SplashScreen.id,
          routes: AppRouter.appRoute,
          locale: Locale(state.language.code),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: const SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.dark,
              ),

              child: child ?? const SizedBox(),
            );
          },
        );
      },
    );
  }
}
