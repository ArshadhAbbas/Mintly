import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/banks_cards_controller.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/card_scanner/add_card_view.dart';
import 'package:mintly/view/home/widgets/add_card.dart';
import 'package:mintly/view/home/widgets/home_screen_banks_card.dart';

class HomeScreenBanksList extends ConsumerWidget {
  const HomeScreenBanksList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentCardIndex = ref.watch(bankCardsIndicatorControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: context.isMobile ? null : context.screenWidth * 0.25,
          width: context.isMobile ? double.infinity : context.screenWidth / 2,
          child: CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (context, index, realIndex) => LayoutBuilder(
              builder: (context, constraints) {
                return index == 0
                    ? InkWell(child: HomeScreenBankCard())
                    : AddCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddCardView()),
                        ),
                      );
              },
            ),
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
        Row(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: List.generate(
            2,
            (index) => AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 2),
              duration: Duration(milliseconds: 500),
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: index == ref.watch(bankCardsIndicatorControllerProvider) ? 4 : 10,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
