import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/base_pallet.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/defulat_pallet.dart';

class AppTheme extends ChangeNotifier {
  BasePallet _pallet = DefulatPallet();

  BasePallet get pallet => _pallet;

  void changeTheme(BasePallet value) {
    _pallet = value;
    notifyListeners();   
  }


  Color get whiteColor => _pallet.whiteColor;
  Color get  blackColor => _pallet.blackColor;
  Color get  greenColor => _pallet.greenColor;
  Color get  redColor => _pallet.redColor;
  Color get  yellowColor => _pallet.yellowColor;
  Color get  deeppurpleColor => _pallet.deeppurpleColor;
  Color get  orangeColor => _pallet.orangeColor;
  Color get  pinkColor => _pallet.pinkColor;
  Color get  blueColor => _pallet.blueColor;
  Color get  greyColor => _pallet.greyColor;
  Color get  blueshade900 => _pallet.blueshade900;
  Color get  blueshade100 => _pallet.blueshade100;
  Color get  greyShade400 => _pallet.greyShade400;
  Color get  greyShade500 => _pallet.greyShade500;
  Color get  amberAccentShade100 => _pallet.amberAccentShade100;
  Color get  redShade600 => _pallet.redShade600;
  Color get  greyShade900 => _pallet.greyShade900;
  Color get  greyShade800 => _pallet.greyShade800;
  Color get  greyShade700 => _pallet.greyShade700;
  Color get  blueshade500 => _pallet.blueshade500;
  Color get  greenshade900 => _pallet.greenshade900;
  Color get  greenAccentShade700 => _pallet.greenAccentShade700;
  Color get  greenAccentShade100 => _pallet.greenAccentShade100;
}
