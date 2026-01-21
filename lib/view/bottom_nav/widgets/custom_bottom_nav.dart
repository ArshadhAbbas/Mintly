import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mintly/controller/bottom_nav_controller.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/bottom_nav/widgets/bottom_nav_indicator.dart';

class CustomBottomNav extends ConsumerWidget {
  const CustomBottomNav({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: kBottomNavigationBarHeight + 10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.scaffoldColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 10, spreadRadius: 5, offset: const Offset(5, 5))],
      ),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          AnimatedAlign(
            duration: Duration(milliseconds: 100),
            alignment: currentIndex == 0
                ? AlignmentDirectional.topStart
                : currentIndex == 1
                ? AlignmentDirectional.topCenter
                : AlignmentDirectional.topEnd,
            child: BottomNavIndicator(),
          ),

          Positioned.fill(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutCubic,
              alignment: currentIndex == 0
                  ? Alignment.centerLeft
                  : currentIndex == 1
                  ? Alignment.center
                  : Alignment.centerRight,
              child: Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => ref.read(bottomNavControllerProvider.notifier).updateBottomNavIndex(index: index),
                  child: SvgPicture.asset(
                    ref.watch(bottomNavIconsProvider)[index],
                    height: 30,
                    width: 30,
                    colorFilter: ColorFilter.mode(
                      ref.watch(bottomNavControllerProvider) == index ? Colors.white : Colors.black.withValues(alpha: 0.2),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
