import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/feature/auth/login/view/login_screen.dart';
import 'package:whatsapp_clone_getx/feature/auth/otp/view/otp_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/callsview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/contact_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/favorites_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/calls/view/scheduled_calls/view/scheduled_calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chat_messages_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/chatview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/payments/view/payment_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/link_devices/view/link_devices_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/new_community/view/new_community_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/communities/view/communitiesview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/module/updates/view/updateview_screen.dart';
import 'package:whatsapp_clone_getx/feature/dashboard/view/dashboard_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/manage_storage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/network_usage_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/Storage_and_data/view/proxy_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/accessibility/view/animation_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_backup_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_history_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/chat_theme_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/end_to_end_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/chats_screen/view/transfer_chat_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/accounts_and_account_bans/view/account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/accounts_and_account_bans/view/accounts_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channel_followers_and_viewers_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/channels/view/channels_get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/ai_experiences_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/back_up_and_restore_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/chat_troubleshooting_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/individual_and_groupchats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/chats/view/media_screen.dart';
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
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/privacy_safety_and_security/view/safety_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/privacy_safety_and_security/view/security_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/accounts_and_account_bans_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/business_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/connect_businesses_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/get_started_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/help_chats_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/help_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/help_and_feedback/help_center/view/payments_screen.dart';
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
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_communities_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/list_groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/lists_screen/view/unread_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen1.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen2.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen3.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/privacy_checkup_screen/view/privacy_checkup_screen4.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/about_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/advanced_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/app_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/calls_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/chat_lock_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/groups_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/lastseen_and_online_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/links_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/live_location_screen.dart';
import 'package:whatsapp_clone_getx/feature/setting/module/privacy_screen/view/privacy_checkup_screen.dart';
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
import 'package:whatsapp_clone_getx/feature/dashboard/module/chats/view/starred/view/starred_screen.dart';

class AppRouter {
  static List<dynamic> appRoute = [];

  static Map<String, WidgetBuilder> routes = {
    SplashScreen.id: (context) => SplashScreen(),
    LoginScreen.id: (context) => LoginScreen(),
    OtpScreen.id: (context) => OtpScreen(),
    DashboardScreen.id: (context) => DashboardScreen(),
    ChatviewScreen.id: (context) => ChatviewScreen(),
    ChatMessagesScreen.id: (context) => ChatMessagesScreen(),
    UpdateviewScreen.id: (context) => UpdateviewScreen(),
    CommunitiesviewScreen.id: (context) => CommunitiesviewScreen(),
    CommunitiesScreen.id: (context) => CommunitiesScreen(),
    CallsviewScreen.id: (context) => CallsviewScreen(),
    FavoritesScreen.id: (context) => FavoritesScreen(),
    ContactScreen.id: (context) => ContactScreen(),
    SettingScreen.id: (context) => SettingScreen(),
    PrivacyScreen.id: (context) => PrivacyScreen(),
    NewCommunityScreen.id: (context) => NewCommunityScreen(),
    BroadcastsScreen.id: (context) => BroadcastsScreen(),
    LinkDevicesScreen.id: (context) => LinkDevicesScreen(),
    StarredScreen.id: (context) => StarredScreen(),
    StatusPrivacyScreen.id: (context) => StatusPrivacyScreen(),
    ScheduledCallsScreen.id: (context) => ScheduledCallsScreen(),
    AccountSettingScreen.id: (context) => AccountSettingScreen(),
    AvatarScreen.id: (context) => AvatarScreen(),
    ListsScreen.id: (context) => ListsScreen(),
    ChatsScreen.id: (context) => ChatsScreen(),
    NotificationsScreen.id: (context) => NotificationsScreen(),
    StorageAndDataScreen.id: (context) => StorageAndDataScreen(),
    AccessibilityScreen.id: (context) => AccessibilityScreen(),
    HelpAndFeedbackScreen.id: (context) => HelpAndFeedbackScreen(),
    InviteFriendScreen.id: (context) => InviteFriendScreen(),
    AppUpdatesScreen.id: (context) => AppUpdatesScreen(),
    ManageStorageScreen.id: (context) => ManageStorageScreen(),
    ProxyScreen.id: (context) => ProxyScreen(),
    UnreadScreen.id: (context) => UnreadScreen(),
    ListGroupsScreen.id: (context) => ListGroupsScreen(),
    ListCommunitiesScreen.id: (context) => ListCommunitiesScreen(),
    ChatBackupScreen.id: (context) => ChatBackupScreen(),
    TransferChatScreen.id: (context) => TransferChatScreen(),
    ChatHistoryScreen.id: (context) => ChatHistoryScreen(),
    EndToEndScreen.id: (context) => EndToEndScreen(),
    AnimationScreen.id: (context) => AnimationScreen(),
    HelpCenterScreen.id: (context) => HelpCenterScreen(),
    SendFeedbackScreen.id: (context) => SendFeedbackScreen(),
    ChannelReportsScreen.id: (context) => ChannelReportsScreen(),
    AppInfoScreen.id: (context) => AppInfoScreen(),
    PaymentScreen.id: (context) => PaymentScreen(),
    QrScreen.id: (context) => QrScreen(),
    GetStartedScreen.id: (context) => GetStartedScreen(),
    HelpChatsScreen.id: (context) => HelpChatsScreen(),
    ConnectBusinessesScreen.id: (context) => ConnectBusinessesScreen(),
    VoiceAndVideoCallsScreen.id: (context) => VoiceAndVideoCallsScreen(),
    HelpCommunitiesScreen.id: (context) => HelpCommunitiesScreen(),
    ChannelsGetStartedScreen.id: (context) => ChannelsGetStartedScreen(),
    PrivacySafetySecurityScreen.id: (context) => PrivacySafetySecurityScreen(),
    AccountsAndAccountBansScreen.id: (context) =>
        AccountsAndAccountBansScreen(),
    PaymentsScreen.id: (context) => PaymentsScreen(),
    BusinessScreen.id: (context) => BusinessScreen(),
    ShowMoreScreen.id: (context) => ShowMoreScreen(),
    SearchHelpCenterScreen.id: (context) => SearchHelpCenterScreen(),
    NetworkUsageScreen.id: (context) => NetworkUsageScreen(),
    ChatThemeScreen.id: (context) => ChatThemeScreen(),
    LastseenAndOnlineScreen.id: (context) => LastseenAndOnlineScreen(),
    ProfilePhotoScreen.id: (context) => ProfilePhotoScreen(),
    AboutScreen.id: (context) => AboutScreen(),
    LinksScreen.id: (context) => LinksScreen(),
    GroupsScreen.id: (context) => GroupsScreen(),
    LiveLocationScreen.id: (context) => LiveLocationScreen(),
    CallsScreen.id: (context) => CallsScreen(),
    AppLockScreen.id: (context) => AppLockScreen(),
    ChatLockScreen.id: (context) => ChatLockScreen(),
    AdvancedScreen.id: (context) => AdvancedScreen(),
    PrivacyCheckupScreen.id: (context) => PrivacyCheckupScreen(),
    PrivacyCheckupScreen1.id: (context) => PrivacyCheckupScreen1(),
    PrivacyCheckupScreen2.id: (context) => PrivacyCheckupScreen2(),
    PrivacyCheckupScreen3.id: (context) => PrivacyCheckupScreen3(),
    PrivacyCheckupScreen4.id: (context) => PrivacyCheckupScreen4(),
    DownloadAndInstallationScreen.id: (context) =>
        DownloadAndInstallationScreen(),
    RegistrationScreen.id: (context) => RegistrationScreen(),
    LinkedDevicesScreen.id: (context) => LinkedDevicesScreen(),
    TroubleshootingScreen.id: (context) => TroubleshootingScreen(),
    HelpContactsScreen.id: (context) => HelpContactsScreen(),
    StatusScreen.id: (context) => StatusScreen(),
    IndividualAndGroupchatsScreen.id: (context) =>
        IndividualAndGroupchatsScreen(),
    BackUpAndRestoreScreen.id: (context) => BackUpAndRestoreScreen(),
    MediaScreen.id: (context) => MediaScreen(),
    VoiceMessagesAndChatsScreen.id: (context) => VoiceMessagesAndChatsScreen(),
    VideoNotesScreen.id: (context) => VideoNotesScreen(),
    AiExperiencesScreen.id: (context) => AiExperiencesScreen(),
    ChatTroubleshootingScreen.id: (context) => ChatTroubleshootingScreen(),
    MessageScreen.id: (context) => MessageScreen(),
    DiscoverScreen.id: (context) => DiscoverScreen(),
    ShopScreen.id: (context) => ShopScreen(),
    VideoCallsScreen.id: (context) => VideoCallsScreen(),
    VoiceCallsScreen.id: (context) => VoiceCallsScreen(),
    VoiceTroubleshootingScreen.id: (context) => VoiceTroubleshootingScreen(),
    HelpGetStartedScreen.id: (context) => HelpGetStartedScreen(),
    AdminScreen.id: (context) => AdminScreen(),
    MemberScreen.id: (context) => MemberScreen(),
    ChannelFollowersAndViewersScreen.id: (context) =>
        ChannelFollowersAndViewersScreen(),
    HelpPrivacyScreen.id: (context) => HelpPrivacyScreen(),
    SafetyScreen.id: (context) => SafetyScreen(),
    SecurityScreen.id: (context) => SecurityScreen(),
    AccountsScreen.id: (context) => AccountsScreen(),
    AccountBansScreen.id: (context) => AccountBansScreen(),
    SettingUpPaymentsScreen.id: (context) => SettingUpPaymentsScreen(),
    PaymentsAndRequestsScreen.id: (context) => PaymentsAndRequestsScreen(),
    SecurityAndPrivacyScreen.id: (context) => SecurityAndPrivacyScreen(),
    SettingUpAnAccountScreen.id: (context) => SettingUpAnAccountScreen(),
    ConnectingWithCustomersScreen.id: (context) =>
        ConnectingWithCustomersScreen(),
    SellingProductsAndServices.id: (context) => SellingProductsAndServices(),
    BusinessTroubleshooting.id: (context) => BusinessTroubleshooting(),
    PremiumFeaturesScreen.id: (context) => PremiumFeaturesScreen(),
    BusinessPlatformScreen.id: (context) => BusinessPlatformScreen(),
  };
}
