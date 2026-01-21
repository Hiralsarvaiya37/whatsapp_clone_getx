import 'package:get/get.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/controller/login_binding.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/controller/otp_binding.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/controller/dashboard_binding.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/controller/call_binding.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/favorites_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/controller/chat_binding.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chat_messages_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/update_bindings.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/controller/updateview_controller.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/status_view_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/disappearing_messages_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/manage_storage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/network_usage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/proxy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/controller/account_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/change_number_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/delete_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/email_address_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/learn_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/pass_keys_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/request_account_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/security_notifications_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/account_screen/view/two_step_verification_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/controller/accessibiity_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/view/animation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/controller/chat_view_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_theme_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/end_to_end_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/transfer_chat_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/controller/setting_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/controller/help_and_feedback_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/accounts_and_account_bans/view/account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/accounts_and_account_bans/view/accounts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channel_admins_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channel_followers_and_viewers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channels_get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channle_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/ai_experiences_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/back_up_and_restore_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/chat_troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/individual_and_groupchats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/media_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/notification_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/video_notes_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/voice_messages_and_chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/communities/view/admin_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/communities/view/help_get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/communities/view/help_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/communities/view/member_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/connect_with_businesses/view/discover_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/connect_with_businesses/view/message_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/connect_with_businesses/view/privacy_safety_security_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/connect_with_businesses/view/shop_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/download_and_installation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/help_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/linked_devices_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/registration_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/status_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/get_started/view/troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/payments/view/payments_and_requests_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/payments/view/security_and_privacy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/payments/view/setting_up_payments_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/privacy_safety_and_security/view/privacy_screen1.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/privacy_safety_and_security/view/safety_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/privacy_safety_and_security/view/security_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/accounts_and_account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/business_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/channles_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/connect_businesses_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/help_chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/help_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/payments_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/privacy_safety_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/search_help_center_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/show_more_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/voice_and_video_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/voice_and_video_calls/view/video_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/voice_and_video_calls/view/voice_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/voice_and_video_calls/view/voice_troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/business_platform_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/business_troubleshooting.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/connecting_with_customers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/premium_features_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/selling_products_and_services.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/whatsapp_for_business/view/setting_up_an_account_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/app_info_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/channel_reports_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/help_center_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/view/send_feedback_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/controller/list_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_favorites_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/unread_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/controller/privacy_view_binding.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen1.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen2.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen3.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen4.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/about_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/avatar_stickers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/chat_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/default_message_timer_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/links_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/live_location_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_checkup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_contacts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/profile_photo_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/status_privacy_screen.dart';
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
import 'package:whatsapp_clone_getx/feature/setting/view/qr_screen.dart';
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
      name: UpdateviewScreen.id,
      page: () => UpdateviewScreen(),
      binding: UpdateBindings(),
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
    GetPage(name: AvatarStickersScreen.id, page: () => AvatarStickersScreen()),
    GetPage(
      name: ListsScreen.id,
      page: () => ListsScreen(),
      binding: ListBinding(),
    ),
    GetPage(
      name: ChatsScreen.id,
      page: () => ChatsScreen(),
      binding: ChatViewBinding(),
    ),
    GetPage(name: ChatBackupScreen.id, page: () => ChatBackupScreen()),
    GetPage(name: TransferChatScreen.id, page: () => TransferChatScreen()),
    GetPage(name: ChatHistoryScreen.id, page: () => ChatHistoryScreen(), binding: ChatViewBinding()),
    GetPage(name: BroadcastsScreen.id, page: () => BroadcastsScreen()),
    GetPage(
      name: ContactScreen.id,
      page: () => ContactScreen(),
      binding: CallBinding(),
    ),
    GetPage(name: NotificationsScreen.id, page: () => NotificationsScreen()),
    GetPage(name: StorageAndDataScreen.id, page: () => StorageAndDataScreen()),
    GetPage(
      name: AccessibilityScreen.id,
      page: () => AccessibilityScreen(),
      binding: AccessibiityBinding(),
    ),
    GetPage(name: AnimationScreen.id, page: () => AnimationScreen()),
    GetPage(
      name: HelpAndFeedbackScreen.id,
      page: () => HelpAndFeedbackScreen(),
      binding: HelpAndFeedbackBinding(),
    ),
    GetPage(name: SendFeedbackScreen.id, page: () => SendFeedbackScreen()),
    GetPage(name: InviteFriendScreen.id, page: () => InviteFriendScreen()),
    GetPage(name: AppUpdatesScreen.id, page: () => AppUpdatesScreen()),
    GetPage(name: QrScreen.id, page: () => QrScreen()),
    GetPage(
      name: LastseenAndOnlineScreen.id,
      page: () => LastseenAndOnlineScreen(),
    ),
    GetPage(name: ProfilePhotoScreen.id, page: () => ProfilePhotoScreen()),
    GetPage(name: AboutScreen.id, page: () => AboutScreen()),
    GetPage(name: LinksScreen.id, page: () => LinksScreen()),
    GetPage(name: StatusPrivacyScreen.id, page: () => StatusPrivacyScreen()),
    GetPage(
      name: DefaultMessageTimerScreen.id,
      page: () => DefaultMessageTimerScreen(),
    ),
    GetPage(name: GroupsScreen.id, page: () => GroupsScreen()),
    GetPage(name: AvatarScreen.id, page: () => AvatarScreen()),
    GetPage(name: LiveLocationScreen.id, page: () => LiveLocationScreen()),
    GetPage(name: CallsScreen.id, page: () => CallsScreen()),
    GetPage(
      name: PrivacyContactsScreen.id,
      page: () => PrivacyContactsScreen(),
    ),
    GetPage(name: AppLockScreen.id, page: () => AppLockScreen()),
    GetPage(name: ChatLockScreen.id, page: () => ChatLockScreen()),
    GetPage(name: AdvancedScreen.id, page: () => AdvancedScreen()),
    GetPage(name: PrivacyCheckupScreen.id, page: () => PrivacyCheckupScreen()),
    GetPage(
      name: PrivacyCheckupScreen1.id,
      page: () => PrivacyCheckupScreen1(),
    ),
    GetPage(
      name: PrivacyCheckupScreen2.id,
      page: () => PrivacyCheckupScreen2(),
    ),
    GetPage(
      name: PrivacyCheckupScreen3.id,
      page: () => PrivacyCheckupScreen3(),
    ),
    GetPage(
      name: PrivacyCheckupScreen4.id,
      page: () => PrivacyCheckupScreen4(),
    ),
    GetPage(name: UnreadScreen.id, page: () => UnreadScreen()),
    GetPage(name: ListFavoritesScreen.id, page: () => ListFavoritesScreen()),
    GetPage(name: ListGroupsScreen.id, page: () => ListGroupsScreen()),
    GetPage(
      name: ListCommunitiesScreen.id,
      page: () => ListCommunitiesScreen(),
    ),
    GetPage(name: ChatThemeScreen.id, page: () => ChatThemeScreen()),
    GetPage(name: ManageStorageScreen.id, page: () => ManageStorageScreen()),
    GetPage(name: NetworkUsageScreen.id, page: () => NetworkUsageScreen()),
    GetPage(name: ProxyScreen.id, page: () => ProxyScreen()),
    GetPage(name: HelpCenterScreen.id, page: () => HelpCenterScreen()),
    GetPage(name: ChannelReportsScreen.id, page: () => ChannelReportsScreen()),
    GetPage(name: AppInfoScreen.id, page: () => AppInfoScreen()),
    GetPage(
      name: SearchHelpCenterScreen.id,
      page: () => SearchHelpCenterScreen(),
    ),
    GetPage(name: GetStartedScreen.id, page: () => GetStartedScreen()),
    GetPage(name: HelpChatsScreen.id, page: () => HelpChatsScreen()),
    GetPage(
      name: ConnectBusinessesScreen.id,
      page: () => ConnectBusinessesScreen(),
    ),
    GetPage(
      name: VoiceAndVideoCallsScreen.id,
      page: () => VoiceAndVideoCallsScreen(),
    ),
    GetPage(
      name: HelpCommunitiesScreen.id,
      page: () => HelpCommunitiesScreen(),
    ),
    GetPage(name: ChannlesScreen.id, page: () => ChannlesScreen()),
    GetPage(name: PrivacySafetyScreen.id, page: () => PrivacySafetyScreen()),
    GetPage(
      name: AccountsAndAccountBansScreen.id,
      page: () => AccountsAndAccountBansScreen(),
    ),
    GetPage(name: PaymentsScreen.id, page: () => PaymentsScreen()),
    GetPage(name: BusinessScreen.id, page: () => BusinessScreen()),
    GetPage(name: ShowMoreScreen.id, page: () => ShowMoreScreen()),
    GetPage(name: AccountsScreen.id, page: () => AccountsScreen()),
    GetPage(name: AccountBansScreen.id, page: () => AccountBansScreen()),
    GetPage(
      name: SettingUpAnAccountScreen.id,
      page: () => SettingUpAnAccountScreen(),
    ),
    GetPage(
      name: ConnectingWithCustomersScreen.id,
      page: () => ConnectingWithCustomersScreen(),
    ),
    GetPage(
      name: SellingProductsAndServices.id,
      page: () => SellingProductsAndServices(),
    ),
    GetPage(
      name: BusinessTroubleshooting.id,
      page: () => BusinessTroubleshooting(),
    ),
    GetPage(
      name: PremiumFeaturesScreen.id,
      page: () => PremiumFeaturesScreen(),
    ),
    GetPage(
      name: BusinessPlatformScreen.id,
      page: () => BusinessPlatformScreen(),
    ),
    GetPage(
      name: ChannelsGetStartedScreen.id,
      page: () => ChannelsGetStartedScreen(),
    ),
    GetPage(
      name: ChannelFollowersAndViewersScreen.id,
      page: () => ChannelFollowersAndViewersScreen(),
    ),
    GetPage(name: ChannelAdminsScreen.id, page: () => ChannelAdminsScreen()),
    GetPage(name: ChannlePrivacyScreen.id, page: () => ChannlePrivacyScreen()),
    GetPage(name: MessageScreen.id, page: () => MessageScreen()),
    GetPage(name: DiscoverScreen.id, page: () => DiscoverScreen()),
    GetPage(name: ShopScreen.id, page: () => ShopScreen()),
    GetPage(
      name: PrivacySafetySecurityScreen.id,
      page: () => PrivacySafetySecurityScreen(),
    ),
    GetPage(
      name: DownloadAndInstallationScreen.id,
      page: () => DownloadAndInstallationScreen(),
    ),
    GetPage(name: RegistrationScreen.id, page: () => RegistrationScreen()),
    GetPage(name: LinkedDevicesScreen.id, page: () => LinkedDevicesScreen()),
    GetPage(
      name: TroubleshootingScreen.id,
      page: () => TroubleshootingScreen(),
    ),
    GetPage(name: HelpContactsScreen.id, page: () => HelpContactsScreen()),
    GetPage(name: StatusScreen.id, page: () => StatusScreen()),
    GetPage(
      name: IndividualAndGroupchatsScreen.id,
      page: () => IndividualAndGroupchatsScreen(),
    ),
    GetPage(
      name: BackUpAndRestoreScreen.id,
      page: () => BackUpAndRestoreScreen(),
    ),
    GetPage(name: NotificationsScreen.id, page: () => NotificationsScreen()),
    GetPage(name: MediaScreen.id, page: () => MediaScreen()),
    GetPage(
      name: VoiceMessagesAndChatsScreen.id,
      page: () => VoiceMessagesAndChatsScreen(),
    ),
    GetPage(name: VideoNotesScreen.id, page: () => VideoNotesScreen()),
    GetPage(name: AiExperiencesScreen.id, page: () => AiExperiencesScreen()),
    GetPage(
      name: ChatTroubleshootingScreen.id,
      page: () => ChatTroubleshootingScreen(),
    ),
    GetPage(name: HelpGetStartedScreen.id, page: () => HelpGetStartedScreen()),
    GetPage(name: AdminScreen.id, page: () => AdminScreen()),
    GetPage(name: MemberScreen.id, page: () => MemberScreen()),
    GetPage(name: HelpPrivacyScreen.id, page: () => HelpPrivacyScreen()),
    GetPage(
      name: SettingUpPaymentsScreen.id,
      page: () => SettingUpPaymentsScreen(),
    ),
    GetPage(
      name: PaymentsAndRequestsScreen.id,
      page: () => PaymentsAndRequestsScreen(),
    ),
    GetPage(
      name: SecurityAndPrivacyScreen.id,
      page: () => SecurityAndPrivacyScreen(),
    ),
    GetPage(name: PrivacyScreen1.id, page: () => PrivacyScreen1()),
    GetPage(name: SafetyScreen.id, page: () => SafetyScreen()),
    GetPage(name: SecurityScreen.id, page: () => SecurityScreen()),
    GetPage(name: VideoCallsScreen.id, page: () => VideoCallsScreen()),
    GetPage(name: VoiceCallsScreen.id, page: () => VoiceCallsScreen()),
    GetPage(
      name: VoiceTroubleshootingScreen.id,
      page: () => VoiceTroubleshootingScreen(),
    ),
    GetPage(
      name: FavoritesScreen.id,
      page: () => FavoritesScreen(),
      binding: CallBinding(),
    ),
    GetPage(name: CommunitiesScreen.id, page: () => CommunitiesScreen()),
    GetPage(
      name: DisappearingMessagesScreen.id,
      page: () => DisappearingMessagesScreen(),
    ),
    GetPage(name: EndToEndScreen.id, page: () => EndToEndScreen()),
    GetPage(name: NotificationScreen.id, page: () => NotificationScreen()),
    GetPage(name: ChatviewScreen.id, page: () => ChatviewScreen()),
    GetPage(
      name: ChatMessagesScreen.id,
      page: () => ChatMessagesScreen(),
      binding: ChatBinding(),
    ),
     GetPage(
      name: ChatviewScreen.id,
      page: () => ChatviewScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: StatusViewScreen.id,
      page: () {
        List<StatusItem> statusList = Get.arguments;
        return StatusViewScreen(statusList: statusList);
      },
    ),
  ];
}
