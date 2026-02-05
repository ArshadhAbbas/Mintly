import 'package:card_scanner/models/card_issuer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/controller/cash_controller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';
import 'package:mintly/view/accounts/widgets/account_type_selection_sheet.dart';
import 'package:mintly/view/add_bank_account/add_new_bank_account.dart';
import 'package:mintly/view/card_scanner/add_card_view.dart';
import 'package:mintly/view/home/widgets/add_cash_bottom_sheet.dart';

class AccountsView extends ConsumerWidget {
  static const String path = "/accounts_view";
  static const String pathName = "accounts_view";

  const AccountsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankAccounts = ref.watch(bankAccountsControllerProvider);
    final cards = ref.watch(cardsControllerProvider);
    final cash = ref.watch(cashControllerProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context) => AccountTypeSelectionSheet());
            },
            icon: HugeIcon(icon: HugeIcons.strokeRoundedResourcesAdd),
          ),
        ],
      ),
      body: bankAccounts.isEmpty && cards.isEmpty && cash.isEmpty
          ? Center(
              child: InkWell(
                onTap: () => showModalBottomSheet(context: context, builder: (context) => AccountTypeSelectionSheet()),
                borderRadius: BorderRadius.circular(30),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 14,
                    children: [
                      HugeIcon(icon: HugeIcons.strokeRoundedResourcesAdd, size: 35, color: Colors.blue),
                      RichText(
                        text: TextSpan(
                          text: "No Accounts, ",
                          style: TextStyleConstants.w400F14.copyWith(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "Add Some",
                              style: TextStyleConstants.w500F14.copyWith(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Center(child: Text("Accounts", style: TextStyleConstants.w600F24)),
                    SizedBox(height: 20),
                    if (bankAccounts.isNotEmpty) ...[
                      Text("Banks", style: TextStyleConstants.w500F14),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => AccountsCard(
                          leading: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(bankAccounts[index].bankName[0], style: TextStyleConstants.w500F20),
                          ),
                          title: bankAccounts[index].bankName,
                          onUpdate: () {
                            context.pushNamed(
                              AddNewBankAccount.pathName,
                              queryParameters: {AddNewBankAccount.updateBankIdQuery: bankAccounts[index].id.toString()},
                            );
                          },
                          onDelete: () {
                            ref.read(bankAccountsControllerProvider.notifier).deleteBank(bankAccounts[index].id);
                          },
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: bankAccounts.length,
                      ),
                    ],
                    if (cards.isNotEmpty) ...[
                      Text("Cards", style: TextStyleConstants.w500F14),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return AccountsCard(
                            leading: cards[index].cardType != null && cards[index].cardType != "Unknown"
                                ? CardIssuer.values
                                      .firstWhere(
                                        (element) =>
                                            element.name.toLowerCase().replaceAll(" ", "") ==
                                            cards[index].cardType?.toLowerCase().replaceAll(" ", ""),
                                      )
                                      .getCardIcon
                                : Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.appThemeYellow),
                                    child: HugeIcon(icon: HugeIcons.strokeRoundedCreditCard),
                                  ),
                            title: cards[index].cardNumber,
                            onUpdate: () {
                              context.pushNamed(
                                AddCardView.pathName,
                                queryParameters: {AddCardView.cardIdQuery: cards[index].cardId.toString()},
                              );
                            },
                            onDelete: () {
                              ref.read(cardsControllerProvider.notifier).deleteCard(cards[index].cardId);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: cards.length,
                      ),
                    ],
                    if (cash.isNotEmpty)
                      Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .start,
                        children: [
                          Text("Cash", style: TextStyleConstants.w500F14),
                          AccountsCard(
                            leading: Text(StringConstants.rupeeIcon, style: TextStyleConstants.w500F20),
                            title: cash.first.balanceAmount,
                            onUpdate: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => AddCashBottomSheet(isUpdating: true, currentAmount: cash.first.balanceAmount),
                              );
                            },
                            onDelete: () async {
                              await ref.read(cashControllerProvider.notifier).deleteCashAccount();
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key, required this.title, required this.leading, required this.onUpdate, required this.onDelete});

  final String title;
  final Widget leading;
  final Function() onDelete, onUpdate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsetsGeometry.all(5),
        menuPadding: EdgeInsetsGeometry.all(5),
        tooltip: "Options",
        constraints: BoxConstraints(maxHeight: 70, maxWidth: 100),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: "edit",
            height: 10,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            onTap: onUpdate,
            child: Center(child: Text("Edit", style: TextStyleConstants.w400F12)),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            value: "delete",
            height: 10,
            onTap: onDelete,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            child: Center(
              child: Text("Delete", style: TextStyleConstants.w400F12.copyWith(color: Colors.red)),
            ),
          ),
        ],
        child: HugeIcon(icon: HugeIcons.strokeRoundedMoreVerticalCircle01, size: 18),
      ),
    );
  }
}
