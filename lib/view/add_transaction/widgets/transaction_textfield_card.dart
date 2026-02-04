
import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class TransactionTextFieldCard extends StatelessWidget {
  const TransactionTextFieldCard({super.key, required this.amountFocusNode, required this.controller});

  final FocusNode amountFocusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(10)),
      height: context.screenHeight / 12,
      width: double.infinity ,
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          TextField(
            onTap: null,
            showCursor: false,
            enableInteractiveSelection: false,
            readOnly: true,
            textAlign: TextAlign.center,
            textAlignVertical: TextAlignVertical.center,
            focusNode: amountFocusNode,
            controller: controller,
            keyboardType: TextInputType.none,
            style: TextStyleConstants.w600F24,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: false,
              isCollapsed: true,
              contentPadding: EdgeInsets.zero,
              hint: Center(
                child: Text(StringConstants.rupeeIcon, style: TextStyleConstants.w600F24.copyWith(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
