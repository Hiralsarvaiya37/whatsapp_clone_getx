import 'package:flutter/material.dart';

enum AccountOptionsEnum {
  securityNotifications,
  passkeys,
  emailAddress,
  twoStepVerification,
  changeNumber,
  requestAccountInfo,
  addAccount,
  deleteAccount,
}

extension AccountOptionsEnumExtension on AccountOptionsEnum{
  String get titles{
    switch(this){
      case AccountOptionsEnum.securityNotifications:
        return "Security notifications";
      case AccountOptionsEnum.passkeys:
         return "Passkeys";
      case AccountOptionsEnum.emailAddress:
        return "Email address";
      case AccountOptionsEnum.twoStepVerification:
        return "Two-step verification";
      case AccountOptionsEnum.changeNumber:
        return "Change number";
      case AccountOptionsEnum.requestAccountInfo:
        return "Request account info";
      case AccountOptionsEnum.addAccount:
        return "Add account";
      case AccountOptionsEnum.deleteAccount:
       return "Delete account";
    }
  }

  IconData get iconData{
    switch(this){
      case AccountOptionsEnum.securityNotifications:
        return Icons.security;
      case AccountOptionsEnum.passkeys:
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