import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/bloc/dashboard_cubit.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/bloc/call_event.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/bloc/chat_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/status_bloc.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_state.dart';
import 'package:whatsapp_clone_getx/feature/setting/bloc/setting_event.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/bloc/accessibility_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/account_screen/bloc/account_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/bloc/chat_view_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/bloc/help_and_feedback_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/bloc/list_view_bloc.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/bloc/privacy_bloc.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';
import 'package:whatsapp_clone_getx/l10n/app_localizations.dart';
import 'package:whatsapp_clone_getx/utils/app_router.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';
import 'package:whatsapp_clone_getx/utils/theme/bloc/theme_bloc.dart';
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
        BlocProvider(create: (_) => CallBloc()..add(LoadContacts())),
        BlocProvider(create: (_) => SettingBloc()..add(LoadProfilePic())),
        BlocProvider(create: (_) => AccessibilityBloc()),
        BlocProvider(create: (_) => PrivacyBloc()),
        BlocProvider(create: (_) => ListViewBloc()),
        BlocProvider(create: (_) => ChatViewBloc()),
        BlocProvider(create: (_) => HelpAndFeedbackBloc()),
        BlocProvider(create: (_) => AccountBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
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
