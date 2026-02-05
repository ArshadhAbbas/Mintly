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
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.white;
            }
            if (states.contains(WidgetState.hovered)) {
              return Colors.white;
            }
            return Colors.black;
          }),
          overlayColor: WidgetStatePropertyAll(Colors.black),
        ),
      ),
      textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.black))),
      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      dialogTheme: DialogThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10))),
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
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: AppColors.appThemeYellow,
        dayPeriodBorderSide: const BorderSide(color: Colors.black),
        dayPeriodShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        dialHandColor: Colors.black,
        dialBackgroundColor: AppColors.appThemeYellow,
        hourMinuteColor: AppColors.appThemeYellow,
        hourMinuteTextColor: Colors.black,
        hourMinuteShape: CircleBorder(),
      ),

      datePickerTheme: DatePickerThemeData(
        backgroundColor: Colors.white,
        headerBackgroundColor: AppColors.appThemeYellow,
        headerForegroundColor: Colors.black,
        todayForegroundColor: WidgetStateProperty.all(AppColors.black),
        dayOverlayColor: WidgetStatePropertyAll(AppColors.appThemeYellow),
        yearForegroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return Colors.black;
        }),
        todayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.appThemeYellow;
          }
          return null;
        }),
        dayShape: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ContinuousRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
              side: BorderSide(color: Colors.black),
            );
          }
          return null;
        }),

        dayForegroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.black;
          } else if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          return Colors.black;
        }),

        dayBackgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.appThemeYellow;
          }
          return null;
        }),
      ),
    );
  }
}
