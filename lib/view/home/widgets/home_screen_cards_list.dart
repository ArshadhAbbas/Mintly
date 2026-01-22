import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';
import 'package:mintly/view/home/widgets/home_screen_card.dart';

class HomeScreenCardsList extends ConsumerWidget {
  const HomeScreenCardsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentCardIndex = ref.watch(cardIndicatorControllerProvider);
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        CarouselSlider.builder(
          itemCount: 2,
          itemBuilder: (context, index, realIndex) => HomeScreenCard(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: false,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) => ref.read(cardIndicatorControllerProvider.notifier).updateCardIndicator(index),
          ),
        ),
        SizedBox(height: 10),
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
