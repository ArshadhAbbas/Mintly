import 'package:flutter/material.dart';
import 'package:mintly/view/home/widgets/home_screen_cards_list.dart';
import 'package:mintly/view/home/widgets/recent_transactions_list.dart';
import 'package:mintly/view/home/widgets/spend_action_buttons_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .start,
        children: [
          HomeScreenCardsList(),
          SizedBox(height: 20),
          SpendActionButtonsList(),
          SizedBox(height: 20),
          RecentTransactionsList(),
          SizedBox(height: kBottomNavigationBarHeight + 25),
        ],
      ),
    );
  }
}
