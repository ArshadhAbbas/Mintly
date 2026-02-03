import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/view/add_bank_account/add_new_bank_account.dart';
import 'package:mintly/view/card_scanner/add_card_view.dart';
import 'package:mintly/view/home/widgets/add_cash_bottom_sheet.dart';

class AccountTypeSelectionSheet extends StatelessWidget {
  const AccountTypeSelectionSheet({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    ValueNotifier selectedAccount = ValueNotifier(AccountType.cards);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: 10,
            children: List.generate(
              3,
              (index) => InkWell(
                onTap: () => selectedAccount.value = AccountType.values[index],
                child: ValueListenableBuilder(
                  valueListenable: selectedAccount,
                  builder: (context, account, child) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: account == AccountType.values[index] ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        AccountType.values[index].name.toTitleCase,
                        style: TextStyleConstants.w400F14.copyWith(
                          color: account == AccountType.values[index] ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          BlackButton(
            onTap: () {
              context.pop();
              if (selectedAccount.value == AccountType.bank) {
                context.pushNamed(AddNewBankAccount.pathName);
              } else if (selectedAccount.value == AccountType.cards) {
                context.pushNamed(AddCardView.pathName);
              } else {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AddCashBottomSheet(),
                );
              }
            },
            text: "Proceed",
            height: 40,
            textSize: 12,
          ),
        ],
      ),
    );
  }
}
