
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'card_switch_controller.g.dart'; 

@riverpod
class CardSwitchController extends _$CardSwitchController {
  @override
  bool build() => false;

  void updateCardSwitch() {
    state = !state;
  }
}

@riverpod
bool cardSwitchStateController(Ref ref) => ref.watch(cardSwitchControllerProvider);

@riverpod
class CardIndicatorController extends _$CardIndicatorController {
  @override
  int build() => 0;

  void updateCardIndicator(int newIndex) {
    state = newIndex;
  }
}

@riverpod
int cardIndicatorStateController(Ref ref) => ref.watch(cardIndicatorControllerProvider);