import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_binding.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/controller/otp_binding.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_binding.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/controller/account_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/delete_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/email_address_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/request_account_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/security_notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/account_screen/view/two_step_verification_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/chats_screen/controller/chat_view_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/privacy_screen/controller/privacy_view_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/accessibility_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/account_setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/app_updates_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/avatar_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/broadcasts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/help_and_feedback_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/invite_friend_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/lists_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/setting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/view/storage_and_data_screen.dart';
import 'package:whatsapp_clone_getx/feature/splash/view/splash_screen.dart';

class AppRouter {
  static List<GetPage<dynamic>> appRoute = [
    GetPage(name: SplashScreen.id, page: () => SplashScreen()),
    GetPage(
      name: LoginScreen.id,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(name: OtpScreen.id, page: () => OtpScreen(), binding: OtpBinding()),
    GetPage(
      name: DashboardScreen.id,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: SettingScreen.id,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AccountSettingScreen.id,
      page: () => AccountSettingScreen(),
      binding: AccountViewBinding(),
    ),
    GetPage(
      name: SecurityNotificationsScreen.id,
      page: () => SecurityNotificationsScreen(),
    ),
    GetPage(name: PassKeysScreen.id, page: () => PassKeysScreen()),
    GetPage(name: EmailAddressScreen.id, page: () => EmailAddressScreen()),
    GetPage(
      name: TwoStepVerificationScreen.id,
      page: () => TwoStepVerificationScreen(),
    ),
    GetPage(name: ChangeNumberScreen.id, page: () => ChangeNumberScreen()),
    GetPage(
      name: RequestAccountInfoScreen.id,
      page: () => RequestAccountInfoScreen(),
    ),
    GetPage(name: DeleteAccountScreen.id, page: () => DeleteAccountScreen()),
    GetPage(name: LearnMoreScreen.id, page: () => LearnMoreScreen()),
    GetPage(
      name: PrivacyScreen.id,
      page: () => PrivacyScreen(),
      binding: PrivacyViewBinding(),
    ),
    GetPage(name: AvatarScreen.id, page: () => AvatarScreen()),
    GetPage(name: ListsScreen.id, page: () => ListsScreen()),
    GetPage(
      name: ChatsScreen.id,
      page: () => ChatsScreen(),
      binding: ChatViewBinding(),
    ),
    GetPage(name: ChatBackupScreen.id, page: () => ChatBackupScreen()),
    GetPage(name: BroadcastsScreen.id, page: () => BroadcastsScreen()),
    GetPage(name: NotificationsScreen.id, page: () => NotificationsScreen()),
    GetPage(name: StorageAndDataScreen.id, page: () => StorageAndDataScreen()),
    GetPage(name: AccessibilityScreen.id, page: () => AccessibilityScreen()),
    GetPage(
      name: HelpAndFeedbackScreen.id,
      page: () => HelpAndFeedbackScreen(),
    ),
    GetPage(name: InviteFriendScreen.id, page: () => InviteFriendScreen()),
    GetPage(name: AppUpdatesScreen.id, page: () => AppUpdatesScreen()),
  ];
}
