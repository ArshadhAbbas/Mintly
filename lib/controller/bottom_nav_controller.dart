import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/view/home/view/home_view.dart';
import 'package:mintly/view/settings/settings_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_controller.g.dart';

@riverpod
class BottomNavController extends _$BottomNavController {
  @override
  int build() => 1;

  void updateBottomNavIndex({required int index}) {
    state = index;
  }
}

@riverpod
int bottomNavIndexController(Ref ref) => ref.watch(bottomNavControllerProvider);

final screensProvider = Provider<List<Widget>>((ref) {
  return [
    Container(height: 100, width: 100, color: Colors.lightGreen),
    HomeView(),
    SettingsView(),
  ];
});

final bottomNavIconsProvider = Provider<List<String>>((ref) {
  return [Assets.bottomNav.analysis.path, Assets.bottomNav.home.path, Assets.bottomNav.settings.path];
});
