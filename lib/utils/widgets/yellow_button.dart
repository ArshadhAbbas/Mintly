import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class YellowButton extends StatelessWidget {
  const YellowButton({super.key, required this.onTap, this.text = "Proceed", this.child});
  final VoidCallback onTap;
  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(10)),
        child: Center(child: child ?? Text(text, style: TextStyleConstants.w400F18)),
      ),
    );
  }
}
