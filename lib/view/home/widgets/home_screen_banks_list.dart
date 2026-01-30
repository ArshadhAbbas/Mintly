import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/banks_cards_controller.dart';
import 'package:mintly/model/bank_accounts_model.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/add_bank_account/add_new_bank_account.dart';
import 'package:mintly/view/home/widgets/add_new_account_card.dart';
import 'package:mintly/view/home/widgets/home_screen_banks_card.dart';

class HomeScreenBanksList extends ConsumerWidget {
  const HomeScreenBanksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentCardIndex = ref.watch(bankCardsIndicatorControllerProvider);
    final List<BankAccountsModel> bankAccounts = ref.watch(bankAccountsControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: context.isMobile ? null : context.screenWidth * 0.25,
          width: context.isMobile ? double.infinity : context.screenWidth / 2,
          child: CarouselSlider.builder(
            itemCount: bankAccounts.length + 1,
            itemBuilder: (context, index, realIndex) => index < bankAccounts.length
                ? InkWell(
                    onTap: () => ref
                        .read(bankAccountsControllerProvider.notifier)
                        .deleteBank(bankAccounts[index].id),
                    child: HomeScreenBankCard(index: index, bankAccountsModel: bankAccounts[index]),
                  )
                : AddNewAccountCard(onTap: () => context.pushNamed(AddNewBankAccount.pathName)),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => ref
                  .read(bankCardsIndicatorControllerProvider.notifier)
                  .updateCardIndicator(index),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: List.generate(
            bankAccounts.length + 1,
            (index) => AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 2),
              duration: Duration(milliseconds: 500),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: index == currentCardIndex ? 4 : 10),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
