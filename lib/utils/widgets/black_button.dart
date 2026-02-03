import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    required this.onTap,
    required this.text,
    this.margin,
    this.width,
    this.borderRadius,
    this.height,
    this.textSize,
  });
  final VoidCallback onTap;
  final String text;
  final EdgeInsetsGeometry? margin;
  final double? height, width, textSize, borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 10),
      child: Container(
        height: height ?? 60,
        margin: margin ?? EdgeInsets.all(12),
        width: width ?? double.infinity,
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Center(
          child: Text(
            text,
            style: TextStyleConstants.w400F16.copyWith(color: Colors.white, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
