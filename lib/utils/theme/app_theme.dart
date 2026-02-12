import 'package:flutter/material.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/base_pallet.dart';
import 'package:whatsapp_clone_getx/utils/theme/pllate/defulat_pallet.dart';

class AppTheme {
  static  BasePallet _pallet = DefulatPallet();

  static void changeTheme(BasePallet value){
    _pallet = value;
  }

 static Color get whiteColor => _pallet.whiteColor;
 static Color get  blackColor => _pallet.blackColor;
 static Color get  greenColor => _pallet.greenColor;
 static Color get  redColor => _pallet.redColor;
 static Color get  yellowColor => _pallet.yellowColor;
 static Color get  deeppurpleColor => _pallet.deeppurpleColor;
 static Color get  orangeColor => _pallet.orangeColor;
 static Color get  pinkColor => _pallet.pinkColor;
 static Color get  blueColor => _pallet.blueColor;
 static Color get  greyColor => _pallet.greyColor;
 static Color get  blueshade900 => _pallet.blueshade900;
 static Color get  blueshade100 => _pallet.blueshade100;
 static Color get  greyShade400 => _pallet.greyShade400;
 static Color get  greyShade500 => _pallet.greyShade500;
 static Color get  amberAccentShade100 => _pallet.amberAccentShade100;
 static Color get  redShade600 => _pallet.redShade600;
 static Color get  greyShade900 => _pallet.greyShade900;
 static Color get  greyShade800 => _pallet.greyShade800;
 static Color get  greyShade700 => _pallet.greyShade700;
 static Color get  blueshade500 => _pallet.blueshade500;
 static Color get  greenshade900 => _pallet.greenshade900;
 static Color get  greenAccentShade700 => _pallet.greenAccentShade700;
 static Color get  greenAccentShade100 => _pallet.greenAccentShade100;
}
