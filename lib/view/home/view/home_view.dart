import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/home/widgets/account_selection_chip.dart';
import 'package:mintly/view/home/widgets/home_screen_banks_list.dart';
import 'package:mintly/view/home/widgets/home_screen_cards_list.dart';
import 'package:mintly/view/home/widgets/recent_transactions_list.dart';
import 'package:mintly/view/home/widgets/spend_action_buttons_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          child: Flex(
            spacing: 20,
            direction: context.isMobile ? Axis.vertical : Axis.horizontal,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Accounts", style: TextStyleConstants.w600F16),
                  ),
                  SizedBox(height: 10),
                  AccountSelectChip(),
                  Consumer(
                    builder: (context, ref, child) {
                      final selectedAccountType = ref.watch(selectedAccountsControllerProvider);

                      return selectedAccountType == AccountType.cards
                          ? HomeScreenCardsList()
                          : HomeScreenBanksList();
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Actions", style: TextStyleConstants.w600F16),
                  ),
                  SizedBox(height: 10),
                  SpendActionButtonsList(),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        RecentTransactionsList(),
        SizedBox(height: kBottomNavigationBarHeight + 25),
      ],
    );
  }
}
