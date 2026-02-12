import 'dart:io';
import 'package:whatsapp_clone_getx/utils/enums/app_theme_mode.dart';
import 'package:whatsapp_clone_getx/utils/enums/language_enum.dart';

abstract class SettingEvent {}

class LoadProfilePic extends SettingEvent {}

class UploadProfilePic extends SettingEvent {
  final File file;
  UploadProfilePic(this.file);
}

class ChangeLanguage extends SettingEvent {
  final LanguageEnum lang;
  ChangeLanguage(this.lang);
}

class ToggleSwitch extends SettingEvent {
  final bool value;
  ToggleSwitch(this.value);
}
class ToggleIsOn1 extends SettingEvent {
  final bool value;
  ToggleIsOn1(this.value);
}


class ToggleItem extends SettingEvent {
  final String key;
  ToggleItem(this.key);
}

class ToggleOption extends SettingEvent {
  final String value;
  ToggleOption(this.value);
}

class ToggleAppUpdateOption extends SettingEvent {
  final int index;
  final bool value;
  ToggleAppUpdateOption(this.index, this.value);
}

class ToggleEnterSend extends SettingEvent {
  final bool value;
  ToggleEnterSend(this.value);
}

class ToggleMediaVisibility extends SettingEvent {
  final bool value;
  ToggleMediaVisibility(this.value);
}

class ToggleKeepChatsArchived extends SettingEvent {
  final bool value;
  ToggleKeepChatsArchived(this.value);
}

class ChangeTheme extends SettingEvent {
  final AppThemeMode theme;
  ChangeTheme(this.theme);
}

class ChangeFontSize extends SettingEvent {
  final double value;
  ChangeFontSize(this.value);
}

class ToggleOptionLight extends SettingEvent {
  final String value;
  ToggleOptionLight(this.value);
}

class ToggleOptionVibrate extends SettingEvent {
  final String value;
  ToggleOptionVibrate(this.value);
}

class ToggleOptionTone extends SettingEvent {
  final String value;
  ToggleOptionTone(this.value);
}
