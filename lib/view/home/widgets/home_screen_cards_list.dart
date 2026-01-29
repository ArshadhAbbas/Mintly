import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text("Cards", style: TextStyleConstants.w500F14.copyWith(color: Colors.white)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: Text("Banks", style: TextStyleConstants.w500F14)),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: Text("Cash", style: TextStyleConstants.w500F14)),
              ),
            ],
          ),
        ),
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
