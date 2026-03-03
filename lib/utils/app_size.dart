import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppSize {
  static const double mobileWidth = 411;
  static const double mobileHeight = 866;
  static Size size = const Size(0, 0);
  static double bottomPadding = 0;
  static double topPadding = 0;
  static double useWidth = 0;
  static double useHeight = 0;

  static void setupData(MediaQueryData queryData) {
    size = queryData.size;
    bottomPadding = queryData.viewPadding.bottom;
    topPadding = queryData.viewPadding.top;
    useWidth = mobileWidth;
    useHeight = mobileHeight;
  }

  static double getSize(double pxSize) {
    bool isMob = !kIsWeb;

    if (isMob) {
      return size.width * pxSize / useWidth;
    } else {
      double scaleWidth = size.width / useWidth;
      double scaleHeight = size.height / useHeight;
      double scale = scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
      return pxSize * scale;
    }
  }

  static double getSizeHeight(double pxSize) {
    return size.height * pxSize / useHeight;
  }
}
