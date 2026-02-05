import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/utils/widgets/numeric_keypad.dart';
import 'package:mintly/view/add_transaction/widgets/select_account_chips.dart';
import 'package:mintly/view/add_transaction/widgets/select_categories_chips.dart';
import 'package:mintly/view/add_transaction/widgets/transaction_description.dart';
import 'package:mintly/view/add_transaction/widgets/transaction_textfield_card.dart';

enum TransacationType { send, recieve }

class AddTransactionView extends StatefulWidget {
  static const String path = "/add_transaction_view";
  static const String pathName = "add_transaction_view";

  const AddTransactionView({super.key, required this.transactionType});
  final TransacationType transactionType;
  @override
  State<AddTransactionView> createState() => _AddTransactionViewState();
}

class _AddTransactionViewState extends State<AddTransactionView> {
  late final TextEditingController amountController;
  late final FocusNode amountFocusNode;
  late ValueNotifier<TransacationType> _transacationType;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    amountFocusNode = FocusNode();
    _transacationType = ValueNotifier(widget.transactionType);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      amountFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    amountFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _transacationType,
            builder: (context, transacationTypeValue, child) {
              return Center(
                child: GestureDetector(
                  onTap: () => _transacationType.value = transacationTypeValue == TransacationType.send
                      ? TransacationType.recieve
                      : TransacationType.send,
                  child: Row(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    mainAxisSize: .min,
                    spacing: 2,
                    children: [
                      Text("${_transacationType.value.name.toTitleCase} Money", style: TextStyleConstants.w600F24),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          TransactionTextFieldCard(amountFocusNode: amountFocusNode, controller: amountController),
          SizedBox(height: 16),
          TransactionDescription(),
          SizedBox(height: 16),
          SelectAccountChips(),
          SizedBox(height: 16),
          SelectCategoriesChips(),
          NumericKeypad(controller: amountController),
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
