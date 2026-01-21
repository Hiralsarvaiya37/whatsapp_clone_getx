import 'package:flutter/material.dart';

enum SettingOptionEnum {
  account,
  privacy,
  avatar,
  lists,
  chat,
  broadcasts,
  notifications,
  storageanddata,
  accesibility,
  applanguage,
  helpandfeedback,
  inviteafriend,
  appupdate,
}

extension SettingOptionEnumExtension on SettingOptionEnum {
  String get titleKey {
    switch (this) {
      case SettingOptionEnum.account:
        return "Account";
      case SettingOptionEnum.privacy:
        return "Privacy";
      case SettingOptionEnum.avatar:
        return "Avatar";
      case SettingOptionEnum.lists:
        return "Lists";
      case SettingOptionEnum.chat:
        return "Chat";
      case SettingOptionEnum.broadcasts:
        return "Broadcasts";
      case SettingOptionEnum.notifications:
        return "Notifications";
      case SettingOptionEnum.storageanddata:
        return "Storage and data";
      case SettingOptionEnum.accesibility:
        return "Accessibility";
      case SettingOptionEnum.applanguage:
        return "App language";
      case SettingOptionEnum.helpandfeedback:
        return "Help and feedback";
      case SettingOptionEnum.inviteafriend:
        return "Invite a friend";
      case SettingOptionEnum.appupdate:
        return "App updates";
    }
  }

  IconData get iconData {
    switch (this) {
      case SettingOptionEnum.account:
        return Icons.key;
      case SettingOptionEnum.privacy:
        return Icons.lock_outline_rounded;
      case SettingOptionEnum.avatar:
        return Icons.person;
      case SettingOptionEnum.lists:
        return Icons.my_library_books_sharp;
      case SettingOptionEnum.chat:
        return Icons.chat;
      case SettingOptionEnum.broadcasts:
        return Icons.broadcast_on_home;
      case SettingOptionEnum.notifications:
        return Icons.notifications_none;
      case SettingOptionEnum.storageanddata:
        return Icons.data_saver_off;
      case SettingOptionEnum.accesibility:
        return Icons.accessibility_new;
      case SettingOptionEnum.applanguage:
        return Icons.language;
      case SettingOptionEnum.helpandfeedback:
        return Icons.help_outline;
      case SettingOptionEnum.inviteafriend:
        return Icons.person_2_outlined;
      case SettingOptionEnum.appupdate:
        return Icons.security_update_good_outlined;
    }
  }

  String get subtitles {
    switch (this) {
      case SettingOptionEnum.account:
        return "Security notifications, change number";
      case SettingOptionEnum.privacy:
        return "Block contacts, sisappearing messages";
      case SettingOptionEnum.avatar:
        return "Create, edit, profile photo";
      case SettingOptionEnum.lists:
        return "Manage people and groups";
      case SettingOptionEnum.chat:
        return "Theme, wallpapers, chat history";
      case SettingOptionEnum.broadcasts:
        return "Manage lists and send broadcasts";
      case SettingOptionEnum.notifications:
        return "Message, group & call tones";
      case SettingOptionEnum.storageanddata:
        return "Network usage, auto-download";
      case SettingOptionEnum.accesibility:
        return "Increase contrast, animation";
      case SettingOptionEnum.applanguage:
        return "English (devices's language)";
      case SettingOptionEnum.helpandfeedback:
        return "Help center, contact us, privacy policy";
      case SettingOptionEnum.inviteafriend:
        return "";
      case SettingOptionEnum.appupdate:
        return "";
    }
  }
}
