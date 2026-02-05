import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/controller/cash_controller.dart';
import 'package:mintly/utils/extensions/buildcontext_extensions.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/add_transaction/add_transaction_view.dart';
import 'package:mintly/view/home/widgets/spend_action_button.dart';

class SpendActionButtonsList extends ConsumerWidget {
  const SpendActionButtonsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bankAccounts = ref.watch(bankAccountsControllerProvider);
    final cards = ref.watch(cardsControllerProvider);
    final cash = ref.watch(cashControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: context.isMobile ? null : context.screenWidth * 0.35,
        width: context.isMobile ? double.infinity : (context.screenWidth / 2) - 40,
        child: Flex(
          direction: context.isMobile ? Axis.horizontal : Axis.vertical,
          spacing: 5,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpendActionButton(
              isFilled: true,
              icon: Icon(Icons.arrow_upward_rounded, color: Colors.white, size: context.isMobile ? null : context.screenWidth / 50),
              buttonText: "Send",
              onTap: () {
                bankAccounts.isEmpty && cash.isEmpty && cards.isEmpty
                    ? context.showCreateAccountDialogue
                    : context.pushNamed(AddTransactionView.pathName, extra: TransacationType.send);
              },
            ),

            SpendActionButton(
              isFilled: false,
              icon: Icon(Icons.arrow_downward_rounded, size: context.isMobile ? null : context.screenWidth / 50),
              onTap: () {
                bankAccounts.isEmpty && cash.isEmpty && cards.isEmpty
                    ? context.showCreateAccountDialogue
                    : context.pushNamed(AddTransactionView.pathName, extra: TransacationType.recieve);
              },
              buttonText: "Receive",
            ),

            // SpendActionButton(
            //   isFilled: false,
            //   icon: Icon(Icons.call_split_rounded, size: context.isMobile ? null : context.screenWidth / 50),
            //   buttonText: "Split",
            //   onTap: () {
            //     print("Split");
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
