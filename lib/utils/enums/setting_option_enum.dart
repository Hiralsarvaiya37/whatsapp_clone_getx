import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

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
   String label(BuildContext context) {
    switch (this) {
      case SettingOptionEnum.account:
        return context.l10n.account;
      case SettingOptionEnum.privacy:
        return context.l10n.privacy;
      case SettingOptionEnum.avatar:
        return context.l10n.avatar;
      case SettingOptionEnum.lists:
        return context.l10n.lists;
      case SettingOptionEnum.chat:
        return context.l10n.chat;
      case SettingOptionEnum.broadcasts:
        return context.l10n.broadcasts;
      case SettingOptionEnum.notifications:
        return context.l10n.notifications;
      case SettingOptionEnum.storageanddata:
        return context.l10n.storageanddata;
      case SettingOptionEnum.accesibility:
        return context.l10n.accessibility;
      case SettingOptionEnum.applanguage:
        return context.l10n.applanguage;
      case SettingOptionEnum.helpandfeedback:
        return context.l10n.helpandfeedback;
      case SettingOptionEnum.inviteafriend:
        return context.l10n.inviteafriend;
      case SettingOptionEnum.appupdate:
        return context.l10n.appupdates;
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
