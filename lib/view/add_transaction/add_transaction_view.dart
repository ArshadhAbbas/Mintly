import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/utils/widgets/numeric_keypad.dart';
import 'package:mintly/view/add_transaction/widgets/select_account_chips.dart';
import 'package:mintly/view/add_transaction/widgets/select_categories_chips.dart';
import 'package:mintly/view/add_transaction/widgets/transaction_textfield_card.dart';

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
          TransactionTextFieldCard(amountFocusNode: amountFocusNode, controller: controller),
          SizedBox(height: 16),
          SelectAccountChips(),
          SizedBox(height: 16),
          SelectCategoriesChips(),
          Expanded(child: NumericKeypad(controller: controller)),
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
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Cancel", style: TextStyleConstants.w500F16),
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
