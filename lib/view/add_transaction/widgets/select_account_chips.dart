import 'package:card_scanner/models/card_issuer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/controller/cash_controller.dart';
import 'package:mintly/controller/transaction_controller.dart';
import 'package:mintly/model/account_item.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';
import 'package:mintly/view/accounts/accounts_view.dart';
import 'package:mintly/view/add_transaction/widgets/account_type_chip.dart';
import 'package:mintly/view/add_transaction/widgets/add_account_chip.dart';

class SelectAccountChips extends StatelessWidget {
  const SelectAccountChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final banks = ref.watch(bankAccountsControllerProvider);
        final cards = ref.watch(cardsControllerProvider);
        final cash = ref.watch(cashControllerProvider);
        final selectedAccountType = ref.watch(selectedAccountChipControllerProvider);
        final selectedAccountNumber = ref.watch(selectedAccountOrCardNumberProvider);

        final List<AccountItem> accounts = [
          if (banks.isNotEmpty) const AccountItem(AccountType.bank),
          if (cards.isNotEmpty) const AccountItem(AccountType.cards),
          if (cash.isNotEmpty) const AccountItem(AccountType.cash),
        ];

        final bool showAddButton = accounts.length < 3;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              children: [
                Row(
                  children: [
                    Text("Accounts", style: TextStyleConstants.w600F16),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => context.pushNamed(AccountsView.pathName),
                      child: SizedBox(height: 30, width: 30, child: Icon(Icons.arrow_forward_ios_rounded, size: 16)),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...accounts.map((account) => AccountTypeChip(type: account.type)),
                    if (showAddButton) const AddAccountChip(),
                  ],
                ),

                if (selectedAccountNumber != null && selectedAccountType != AccountType.cash) ...[
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      crossAxisAlignment: .center,
                      children: [
                        Text(
                          selectedAccountType == AccountType.bank
                              ? banks.firstWhere((element) => element.accountNumber == selectedAccountNumber).accountNumber
                              : cards.firstWhere((element) => element.cardNumber == selectedAccountNumber).cardNumber,
                          style: TextStyleConstants.w600F14,
                        ),

                        selectedAccountType == AccountType.bank
                            ? Text(banks.firstWhere((element) => element.accountNumber == selectedAccountNumber).bankName)
                            : CardIssuer.values
                                  .firstWhere(
                                    (element) =>
                                        element.name.toLowerCase().replaceAll(" ", "") ==
                                        cards
                                            .firstWhere((element) => element.cardNumber == selectedAccountNumber)
                                            .cardType
                                            ?.toLowerCase()
                                            .replaceAll(" ", ""),
                                  )
                                  .getCardIcon,

                        // trailing,
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
