import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/controller/cash_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/add_bank_account/add_new_bank_account.dart';
import 'package:mintly/view/card_scanner/add_card_view.dart';
import 'package:mintly/view/home/widgets/add_cash_bottom_sheet.dart';
import 'package:sliding_action_button/sliding_action_button.dart';

class AccountTypeSelectionSheet extends StatelessWidget {
  const AccountTypeSelectionSheet({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    ValueNotifier selectedAccount = ValueNotifier(AccountType.cards);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            spacing: context.screenWidth/16,
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
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(50)),
            child: CircleSlideToActionButton(
              width: context.screenWidth,
              parentBoxBackgroundColor: Colors.white,
              parentBoxDisableBackgroundColor: Colors.white,
              initialSlidingActionLabel: "Slide to Proceed",
              finalSlidingActionLabel: "",
              circleSlidingButtonIcon: Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                height: 40,
                width: 40,
                child: Icon(Icons.arrow_forward, color: Colors.white),
              ),
              onSlideActionCompleted: () {
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
                    builder: (context) => Consumer(
                      builder: (context, ref, child) {
                        final cash = ref.watch(cashControllerProvider);
                        return AddCashBottomSheet(
                              isUpdating: cash.isNotEmpty,
                              currentAmount: cash.isEmpty ? null : cash.first.balanceAmount,
                            );
                      },
                    ),
                  );
                }
              },
              onSlideActionCanceled: () {},
              parentBoxRadiusValue: 30,
            ),
          ),
        ],
      ),
    );
  }
}
