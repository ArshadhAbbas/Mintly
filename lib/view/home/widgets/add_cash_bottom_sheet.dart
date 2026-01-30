import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:mintly/model/cash_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/extensions/buildcontext_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/view/card_scanner/widgets/add_card_text_field.dart';

class AddCashBottomSheet extends StatefulWidget {
  const AddCashBottomSheet({super.key, this.isUpdating, this.currentAmount});
  final bool? isUpdating;
  final String? currentAmount;

  @override
  State<AddCashBottomSheet> createState() => _AddCashBottomSheetState();
}

class _AddCashBottomSheetState extends State<AddCashBottomSheet> {
  final TextEditingController cashController = TextEditingController();
  @override
  void initState() {
    if (widget.isUpdating != null && widget.currentAmount != null) {
      cashController.text = widget.currentAmount!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Wallet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            AddCardTextField(
              textEdingController: cashController,
              hintText: "10000",
              prefix: Text(StringConstants.rupeeIcon),
            ),
            const SizedBox(height: 16),
            BlackButton(
              margin: EdgeInsets.symmetric(vertical: 10),
              onTap: () {
                if (cashController.text.isEmpty) {
                  context.showSnackBar("Cannot be empty");
                } else {
                  CashModel cashModel = CashModel(
                    balanceAmount: cashController.text.trim(),
                    updatedTime: DateTime.now(),
                  );
                  var box = Hive.box<CashModel>(HiveBoxes.cashBox);
                  if (box.isEmpty) {
                    box.add(cashModel);
                  } else {
                    box.putAt(0, cashModel);
                  }
                  context.pop();
                }
              },
              text: "Add Cash",
            ),
          ],
        ),
      ),
    );
  }
}
