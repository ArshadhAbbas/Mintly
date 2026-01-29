import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.lime,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Colors.grey,
        selectionHandleColor: Colors.black,
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyleConstants.w700F28,
        headlineMedium: TextStyleConstants.w600F22,
        titleLarge: TextStyleConstants.w600F18,
        bodyLarge: TextStyleConstants.w500F16,
        bodyMedium: TextStyleConstants.w400F14,
        bodySmall: TextStyleConstants.w400F12,
        labelLarge: TextStyleConstants.w600F14,
      ),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black))),
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),

      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: AppColors.white,
      ),

      dividerTheme: DividerThemeData(color: AppColors.dividerLight, thickness: 1),
      iconTheme: const IconThemeData(color: AppColors.textPrimaryLight, size: 22),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.textPrimaryLight,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.textSecondaryLight,
        type: BottomNavigationBarType.fixed,
      ),

      inputDecorationTheme: InputDecorationTheme(
        // change cursor color
        filled: true,
        fillColor: AppColors.lightSurface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
