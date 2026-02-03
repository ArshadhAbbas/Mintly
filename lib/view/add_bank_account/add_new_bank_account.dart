import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/model/bank_accounts_model.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/buildcontext_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/view/card_scanner/widgets/add_card_text_field.dart';

class AddNewBankAccount extends ConsumerStatefulWidget {
  static const String path = "/add_new_bank_account";
  static const String pathName = "add_new_bank_account";
  static const String updateBankIdQuery = "update_bank_id";
  const AddNewBankAccount({super.key, this.bankId});
  final int? bankId;

  @override
  ConsumerState<AddNewBankAccount> createState() => _AddNewBankAccountState();
}

class _AddNewBankAccountState extends ConsumerState<AddNewBankAccount> {
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ifsController = TextEditingController();
  TextEditingController balanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.bankId != null) {
        final bankAccounts = ref.read(bankAccountsControllerProvider);
        final bank = bankAccounts.firstWhere((e) => e.id == widget.bankId);
        accountNumberController.text = bank.accountNumber;
        bankNameController.text = bank.bankName;
        ifsController.text = bank.ifscCode;
        balanceController.text = bank.accountBalance.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Add Bank", style: TextStyleConstants.w600F20),
              SizedBox(height: 20),
              Text(
                "Enter your Bank Account Details",
                style: TextStyleConstants.w400F14.copyWith(color: Colors.black.withValues(alpha: 0.3)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bank Name", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: bankNameController,
                    hintText: "ABC BANK",
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                  ),

                  SizedBox(height: 15),
                  Text("Account Number", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: accountNumberController,
                    hintText: "************",
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textInputType: TextInputType.numberWithOptions(),
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 15),
                  Text("IFSC Code", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: ifsController,
                    hintText: "IFSC",
                    textInputAction: TextInputAction.next,
                    inputFormatters: [LengthLimitingTextInputFormatter(11)],
                  ),

                  SizedBox(height: 15),
                  Text("Current Balance", style: TextStyleConstants.w400F14),
                  SizedBox(height: 6),
                  AddCardTextField(
                    textEdingController: balanceController,
                    hintText: "123",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    prefix: Text(StringConstants.rupeeIcon),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BlackButton(
        onTap: () {
          if ([bankNameController, accountNumberController, ifsController].any((element) => element.text.trim().isEmpty)) {
            context.showSnackBar("Please fill all the mandatory fields");
            return;
          } else {
            var bankAccounts = ref.watch(bankAccountsControllerProvider);
            ref
                .read(bankAccountsControllerProvider.notifier)
                .addNewBank(
                  BankAccountsModel(
                    id: widget.bankId != null
                        ? widget.bankId!
                        : bankAccounts.isEmpty
                        ? 0
                        : bankAccounts.last.id + 1,
                    bankName: bankNameController.text.trim(),
                    accountNumber: accountNumberController.text.trim().replaceAll(" ", ""),
                    ifscCode: ifsController.text.trim().replaceAll(" ", ""),
                    accountBalance: balanceController.text.isEmpty ? 0 : num.parse(balanceController.text.trim()),
                  ),
                );
          }
          context.pop();
        },
        text: "Save Account",
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      ),
    );
  }
}
