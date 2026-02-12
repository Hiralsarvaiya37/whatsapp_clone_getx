import 'package:flutter/cupertino.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/callsview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/favorites_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chat_messages_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/bloc/update_state.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/status_view_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/accessibility_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/account_setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/app_updates_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/avatar_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/broadcasts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/help_and_feedback_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/invite_friend_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/lists_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/storage_and_data_screen.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';

class AppRouter {
  static final Map<String, WidgetBuilder> appRoute = {
    SplashScreen.id: (context) =>  SplashScreen(),
    LoginScreen.id: (context) =>  LoginScreen(),

    OtpScreen.id: (context) {
      final vid =
          ModalRoute.of(context)!.settings.arguments as String;
      return OtpScreen(verificationId: vid);
    },

    DashboardScreen.id: (context) =>  DashboardScreen(),
    ChatviewScreen.id: (context) =>  ChatviewScreen(),
    ChatMessagesScreen.id: (context) =>  ChatMessagesScreen(),
    UpdateviewScreen.id: (context) =>  UpdateviewScreen(),

    StatusViewScreen.id: (context) {
      final list =
          ModalRoute.of(context)!.settings.arguments as List<StatusItem>;
      return StatusViewScreen(statusList: list);
    },

    CallsviewScreen.id: (context) =>  CallsviewScreen(),
    ContactScreen.id: (context) =>  ContactScreen(),
    FavoritesScreen.id: (context) =>  FavoritesScreen(),
    SettingScreen.id: (context) =>  SettingScreen(),
    PrivacyScreen.id: (context) =>  PrivacyScreen(),
    ListsScreen.id: (context) =>  ListsScreen(),
    AccountSettingScreen.id: (context) =>  AccountSettingScreen(),
    AvatarScreen.id: (context) =>  AvatarScreen(),
    ChatsScreen.id: (context) =>  ChatsScreen(),
    ChatBackupScreen.id: (context) =>  ChatBackupScreen(),
    ChatHistoryScreen.id: (context) =>  ChatHistoryScreen(),
    BroadcastsScreen.id: (context) =>  BroadcastsScreen(),
    StorageAndDataScreen.id: (context) =>  StorageAndDataScreen(),
    AccessibilityScreen.id: (context) =>  AccessibilityScreen(),
    HelpAndFeedbackScreen.id: (context) =>  HelpAndFeedbackScreen(),
    InviteFriendScreen.id: (context) =>  InviteFriendScreen(),
    AppUpdatesScreen.id: (context) =>  AppUpdatesScreen(),
  };
}
