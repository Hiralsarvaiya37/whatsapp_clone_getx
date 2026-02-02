import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/helper/l10n_ext.dart';

enum AccountOptionsEnum {
  securityNotifications,
  passKeys,
  emailAddress,
  twoStepVerification,
  changeNumber,
  requestAccountInfo,
  addAccount,
  deleteAccount,
}

extension AccountOptionsEnumExtension on AccountOptionsEnum{
 String labels(BuildContext context) {
    switch(this){
      case AccountOptionsEnum.securityNotifications:
        return context.l10n.securitynotifications;
      case AccountOptionsEnum.passKeys:
         return context.l10n.passkeys;
      case AccountOptionsEnum.emailAddress:
        return context.l10n.emailaddress;
      case AccountOptionsEnum.twoStepVerification:
        return context.l10n.twostepverification;
      case AccountOptionsEnum.changeNumber:
        return context.l10n.changenumber;
      case AccountOptionsEnum.requestAccountInfo:
        return context.l10n.requestaccountinfo;
      case AccountOptionsEnum.addAccount:
        return context.l10n.addaccount;
      case AccountOptionsEnum.deleteAccount:
       return context.l10n.deleteAccount;
    }
  }

  IconData get iconData{
    switch(this){
      case AccountOptionsEnum.securityNotifications:
        return Icons.security;
      case AccountOptionsEnum.passKeys:
         return Icons.person_add_alt_1;
      case AccountOptionsEnum.emailAddress:
        return Icons.email_outlined;
      case AccountOptionsEnum.twoStepVerification:
        return Icons.keyboard_control;
      case AccountOptionsEnum.changeNumber:
        return Icons.system_update_rounded;
      case AccountOptionsEnum.requestAccountInfo:
        return Icons.upload_file_outlined;
      case AccountOptionsEnum.addAccount:
        return Icons.person_add_alt;
      case AccountOptionsEnum.deleteAccount:
       return Icons.delete;
    }
  }
}