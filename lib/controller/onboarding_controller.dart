import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  int build() => 0;

  void updateCurrentIndex(int index) {
    state = index;
  }
}

@riverpod
int onboardingIndex(Ref ref) => ref.watch(onboardingControllerProvider);
