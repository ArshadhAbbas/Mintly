import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/home/widgets/account_selection_chip.dart';
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
                          : LayoutBuilder(
                              builder: (context, constraints) {
                                return InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).scaffoldBackgroundColor,
                                      border: Border.all(color: AppColors.appThemeYellow, width: 3),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(color: Colors.black, offset: Offset(5, 5)),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        HugeIcon(icon: HugeIcons.strokeRoundedAddCircle, size: 35),
                                        SizedBox(height: 10),
                                        Center(
                                          child: Text(
                                            "Add New Card",
                                            style: TextStyleConstants.w400F14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
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
