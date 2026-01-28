import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
final TextEditingController textEditingController;
  const AppTextField({super.key, required this.hintText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onTapUpOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        filled: false,
        hintText: hintText,
        labelText: hintText,
        labelStyle: TextStyleConstants.w400F12.copyWith(color: Colors.black),
        alignLabelWithHint: true,
        hintStyle: TextStyleConstants.w400F12.copyWith(color: Colors.black.withValues(alpha: 0.2)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appThemeYellow, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appThemeYellow, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appThemeYellow, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
    );
  }
}
