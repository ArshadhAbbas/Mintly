import 'package:flutter/material.dart';

extension MediaQueryExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  Size get screenSize => Size(screenWidth, screenHeight);
}
