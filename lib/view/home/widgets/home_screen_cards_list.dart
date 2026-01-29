import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/home/widgets/add_card.dart';
import 'package:mintly/view/home/widgets/home_screen_card.dart';

class HomeScreenCardsList extends ConsumerWidget {
  const HomeScreenCardsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentCardIndex = ref.watch(cardIndicatorControllerProvider);
    final List<CardModel> cards = ref.watch(cardsControllerProvider);

    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.isMobile ? null : context.screenWidth * 0.25,
          width: context.isMobile ? double.infinity : context.screenWidth / 2,
          child: CarouselSlider.builder(
            itemCount: cards.length + 1,
            itemBuilder: (context, index, realIndex) => index < cards.length
                ? InkWell(
                    onTap: () => ref.read(cardsControllerProvider.notifier).deleteCard(cards[index].cardId),
                    child: HomeScreenCard(cardModel: cards[index]),
                  )
                : AddCard(),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: false,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => ref.read(cardIndicatorControllerProvider.notifier).updateCardIndicator(index),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: List.generate(
            cards.length + 1,
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
