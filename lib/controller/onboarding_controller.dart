import 'package:mintly/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  int build() => 0;

  Future<void> updateCurrentIndex(int index) async {
    state = index;
    await prefs?.setBool("didShow", true);
  }
}

@riverpod
int onboardingIndex(Ref ref) => ref.watch(onboardingControllerProvider);
