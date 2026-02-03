import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/utils/widgets/numeric_keypad.dart';

class AddTransactionView extends StatefulWidget {
  static const String path = "/add_transaction_view";
  static const String pathName = "add_transaction_view";

  const AddTransactionView({super.key});

  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  late final TextEditingController controller;
  late final FocusNode amountFocusNode;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    amountFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      amountFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text("Send Money", style: TextStyleConstants.w600F24)),
          const SizedBox(height: 20),
          Expanded(
            child: Flex(
              direction: context.isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(20)),
                  height: context.isMobile ? context.screenHeight / 3.5 : context.screenWidth * 0.25,
                  width: context.isMobile ? double.infinity : context.screenWidth / 2,
                  child: TextField(
                    onTap: null,
                    showCursor: false,
                    enableInteractiveSelection: false,
                    readOnly: true,
                    textAlign: TextAlign.center,
                    focusNode: amountFocusNode,
                    controller: controller,
                    keyboardType: TextInputType.none,
                    style: TextStyleConstants.w600F24,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: false,
                      hint: Center(
                        child: Text(StringConstants.rupeeIcon, style: TextStyleConstants.w600F24.copyWith(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                Expanded(child: NumericKeypad(controller: controller)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(overlayColor: Colors.black),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Cancel", style: TextStyleConstants.w500F16.copyWith(color: Colors.black)),
                ),
              ),
            ),
            Expanded(
              child: BlackButton(onTap: () {}, text: "Proceed", borderRadius: 30, height: 45, margin: EdgeInsets.zero),
            ),
          ],
        ),
      ),
    );
  }
}
