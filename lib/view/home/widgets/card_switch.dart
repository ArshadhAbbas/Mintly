import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';

class CardSwitch extends ConsumerWidget {
  const CardSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool cardSwitchValue = ref.watch(cardSwitchControllerProvider);
    return GestureDetector(
      onTap: () => ref.read(cardSwitchControllerProvider.notifier).updateCardSwitch(),
      child: Container(
        height: 20,
        width: 30,
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color: Colors.white)),
        child: AnimatedAlign(
          alignment: cardSwitchValue ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
          duration: Duration(milliseconds: 100),
          child: Container(height: 20,width: 20,decoration: BoxDecoration(color: Colors.white,shape: BoxShape.circle),),
        ),
      ),
    );
  }
}
