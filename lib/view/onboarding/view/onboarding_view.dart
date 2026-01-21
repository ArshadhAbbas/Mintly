import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/onboarding_controller.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/utils/app_constants.dart/app_theme.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class OnBoardingView extends ConsumerWidget {
  static String path = "/";
  static String pathName = "on_boarding";

  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final imagesList = [Assets.onBoarding.onBoarding1, Assets.onBoarding.onBording2, Assets.onBoarding.onBoarding3];
    final onBoardingContents = {
      "Know Where Your Money Goes": "Track spending, income, and savings in one place. Mintly helps you stay aware without the stress.",
      "Plan, Save, and Stay in Control": "Set goals, manage budgets, and organize your money with tools designed for everyday decisions.",
      "Build Better Money Habits":
          "From daily expenses to long-term savings, Mintly helps you make smarter financial choices with confidence.",
    };
    int currentIndex = ref.watch(onboardingIndexProvider);
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                    child: Text("Skip", style: TextStyleConstants.w500F14.copyWith(decoration: TextDecoration.underline)),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      imagesList.length,
                      (index) => AnimatedContainer(
                        margin: EdgeInsets.all(2),
                        duration: Duration(milliseconds: 500),
                        width: index == currentIndex ? 20 : 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: index == currentIndex ? Colors.black : Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                height: context.screenHeight / 3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: imagesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    ref.read(onboardingControllerProvider.notifier).updateCurrentIndex(index);
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(imagesList[index].path);
                  },
                ),
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  height: context.screenHeight / 2.4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) => SlideTransition(
                        position: Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                      child: Column(
                        key: ValueKey(currentIndex),
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            onBoardingContents.keys.toList()[currentIndex],
                            style: TextStyleConstants.w700F18.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Text(
                            onBoardingContents.values.toList()[currentIndex],
                            style: TextStyleConstants.w400F14.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: -20,
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex < imagesList.length - 1) {
                        pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                      } else {
                        // Navigate to login / home
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.light().scaffoldBackgroundColor),
                      child: Container(
                        height: context.screenHeight / 8,
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
