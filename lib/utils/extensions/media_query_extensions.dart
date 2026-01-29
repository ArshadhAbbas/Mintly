import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  Size get screenSize => Size(screenWidth, screenHeight);
  bool get isMobile => screenWidth < 760;
  bool get isTablet => screenWidth >= 760 && screenWidth < 1024;
  bool get isDesktop => screenWidth >= 1024;
}

extension ThemeExtensions on BuildContext {
  Color get scaffoldColor => Theme.of(this).scaffoldBackgroundColor;
}
