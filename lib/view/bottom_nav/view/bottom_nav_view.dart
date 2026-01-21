import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mintly/gen/assets.gen.dart';

class BottomNavView extends ConsumerWidget {
  static const String path = "/bottom_nav_view";
  static const String pathName = "bottom_nav_view";
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: SvgPicture.asset(Assets.general.mintlyLogo.path, height: 20)),
    );
  }
}
