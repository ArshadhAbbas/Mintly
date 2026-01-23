import 'package:flutter/material.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
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
            children: [HomeScreenCardsList(), SpendActionButtonsList()],
          ),
        ),
        SizedBox(height: 20),
        RecentTransactionsList(),
        SizedBox(height: kBottomNavigationBarHeight + 25),
      ],
    );
  }
}
