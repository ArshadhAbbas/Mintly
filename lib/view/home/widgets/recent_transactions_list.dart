import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/view/home/widgets/transaction_card.dart';

class RecentTransactionsList extends StatelessWidget {
  const RecentTransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .center,
            children: [
              Text("Recent Activity", style: TextStyleConstants.w600F16),
              TextButton(
                onPressed: () {},
                child: Text("View All", style: TextStyleConstants.w500F12.copyWith(decoration: TextDecoration.underline)),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => TransactionCard(),
          ),
        ],
      ),
    );
  }
}
