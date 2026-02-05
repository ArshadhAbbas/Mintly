import 'package:card_scanner/models/card_issuer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/controller/transaction_controller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';

class AccountTypeChip extends ConsumerWidget {
  const AccountTypeChip({required this.type, super.key});
  final AccountType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChip = ref.watch(selectedAccountChipControllerProvider);
    final banks = ref.watch(bankAccountsControllerProvider);
    final cards = ref.watch(cardsControllerProvider);

    return GestureDetector(
      onTap: () {
        if (type == AccountType.cash) {
          ref.read(selectedAccountChipControllerProvider.notifier).updateType(type);
        } else {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.white,
                child: ListView.separated(
                  itemBuilder: (context, index) => getContainer(
                    context: context,
                    title: type == AccountType.bank ? banks[index].accountNumber : cards[index].cardNumber,
                    trailing: type == AccountType.bank
                        ? Text(banks[index].bankName)
                        : CardIssuer.values
                              .firstWhere(
                                (element) =>
                                    element.name.toLowerCase().replaceAll(" ", "") ==
                                    cards[index].cardType?.toLowerCase().replaceAll(" ", ""),
                              )
                              .getCardIcon,

                    ref: ref,
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: type == AccountType.bank ? banks.length : cards.length,
                ),
              );
            },
          );
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(),
          color: selectedChip == type ? Colors.black : Colors.white,
        ),
        child: Text(_label, style: TextStyle(color: selectedChip == type ? Colors.white : Colors.black)),
      ),
    );
  }

  Widget getContainer({required String title, required Widget trailing, required WidgetRef ref, required BuildContext context}) {
    return InkWell(
      onTap: () => {
        ref.read(selectedAccountChipControllerProvider.notifier).updateType(type),
        ref.read(selectedAccountOrCardNumberProvider.notifier).updateAccountOrCardNumber(title),
        context.pop(),
      },
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          children: [
            Text(title, style: TextStyleConstants.w600F14),
            trailing,
          ],
        ),
      ),
    );
  }

  String get _label {
    switch (type) {
      case AccountType.bank:
        return "Bank";
      case AccountType.cards:
        return "Card";
      case AccountType.cash:
        return "Cash";
    }
  }
}
