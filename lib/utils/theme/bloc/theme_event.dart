import 'package:whatsapp_clone_getx/utils/theme/pllate/base_pallet.dart';

abstract class ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final BasePallet pallet;
  ChangeTheme(this.pallet);
}
