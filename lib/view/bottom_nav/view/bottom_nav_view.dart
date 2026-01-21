import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mintly/controller/bottom_nav_controller.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/view/bottom_nav/widgets/custom_bottom_nav.dart';

class BottomNavView extends ConsumerWidget {
  static const String path = "/bottom_nav_view";
  static const String pathName = "bottom_nav_view";
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentIndex = ref.watch(bottomNavControllerProvider);
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(Assets.general.mintlyLogo.path, height: 20)),
      body: Center(child: ref.read(screensProvider)[currentIndex]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomBottomNav(currentIndex: currentIndex),
    );
  }
}
