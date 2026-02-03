import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/view/accounts/accounts_view.dart';
import 'package:mintly/view/categories/categories_view.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(  
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Center(child: Text("Preferences", style: TextStyleConstants.w600F24)),
            SizedBox(height: 20),
            PreferenceSelectItem(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedTransactionHistory),
              text: "Transactions",
              onTap: () {},
            ),
            PreferenceSelectItem(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedMoneyExchange03),
              text: "Accounts",
              onTap: () {
                context.pushNamed(AccountsView.pathName);
              },
            ),
            PreferenceSelectItem(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedArrange),
              text: "Categories",
              onTap: () {
                context.pushNamed(CategoriesView.pathName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PreferenceSelectItem extends StatelessWidget {
  const PreferenceSelectItem({super.key, required this.text, required this.icon, required this.onTap});

  final String text;
  final HugeIcon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Container(
              height: 35,
              width: 35,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(shape: .circle, color: AppColors.appThemeYellow),
              child: icon,
            ),
            SizedBox(width: 10),
            Text(text, style: TextStyleConstants.w400F16),
            Spacer(),
            HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, size: 14),
          ],
        ),
      ),
    );
  }
}
