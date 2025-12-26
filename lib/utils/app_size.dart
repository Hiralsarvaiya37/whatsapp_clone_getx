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
    return size.width * pxSize / useWidth;
  }

  static double getSizeHeight(double pxSize) {
    return size.height * pxSize / useHeight;
  }
}
