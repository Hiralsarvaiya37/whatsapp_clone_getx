import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/l10n/app_localizations.dart';

extension AppL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}