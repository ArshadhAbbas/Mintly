import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class AddCardTextField extends StatelessWidget {
  const AddCardTextField({
    super.key,
    required this.textEdingController,
    required this.hintText,
    this.inputFormatters,
    this.textInputType,
    this.textInputAction,
    this.maxLength,
    this.prefix,
  });

  final TextEditingController textEdingController;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: textEdingController,
      style: TextStyleConstants.w500F14,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      maxLength: maxLength,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Center(child: prefix)),
        prefixIconColor: Colors.black.withValues(alpha: 0.5),
        prefixIconConstraints: prefix != null
            ? BoxConstraints(maxWidth: 20, maxHeight: 20)
            : BoxConstraints(maxWidth: 0, maxHeight: 0),
        counterText: "",
        filled: false,
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyleConstants.w400F12.copyWith(color: Colors.black.withValues(alpha: 0.3)),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}
