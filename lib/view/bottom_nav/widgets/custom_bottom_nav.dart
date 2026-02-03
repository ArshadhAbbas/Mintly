import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/bottom_nav_controller.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class CustomBottomNav extends ConsumerWidget {
  const CustomBottomNav({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(clipBehavior: Clip.none,
      padding: EdgeInsets.symmetric(horizontal: 25),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.scaffoldColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.15), blurRadius: 10, spreadRadius: 5, offset: const Offset(5, 5))],
      ),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 14.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (index) => InkWell(
                  onTap: () => ref.read(bottomNavControllerProvider.notifier).updateBottomNavIndex(index: index),
                  child: SizedBox(
                    width: context.screenWidth * 0.2,
                    child: Align(
                      alignment: index==0?Alignment.centerLeft:index==1?Alignment.center:Alignment.centerRight,
                      child: HugeIcon(
                        icon: ref.watch(bottomNavIconsProvider)[index],
                        size: 20,
                        color: ref.watch(bottomNavControllerProvider) == index ? Colors.white : Colors.black.withValues(alpha: 0.2),
                      ),
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
