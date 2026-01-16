import 'package:flutter/material.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/utils/app_constants.dart/app_theme.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class OnBoardingView extends StatefulWidget {
  static String path = "/";
  static String pathName = "on_boarding";

  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  final imagesList = [Assets.onBoarding.onBoarding1, Assets.onBoarding.onBording2, Assets.onBoarding.onBoarding3];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
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
            ),
            SizedBox(height: 60),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: SizedBox(
                height: context.screenHeight / 3,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: imagesList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
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
                  height: context.screenHeight / 2.4,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Colors.black),
                ),

                Positioned(
                  bottom: -20,
                  child: GestureDetector(
                    onTap: () {
                      if (currentIndex < imagesList.length - 1) {
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
