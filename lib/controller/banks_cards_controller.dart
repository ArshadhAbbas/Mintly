import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'banks_cards_controller.g.dart'; 

@riverpod
class BanksCardsSwitchController extends _$BanksCardsSwitchController{
  @override
  bool build(int index)=>false;
  void updateSwitch(){
    state=!state;
  }

}

@riverpod
class BankCardsIndicatorController extends _$BankCardsIndicatorController{
  @override
  int build()=>0;
  void updateCardIndicator(int newIndex){
    state= newIndex;
  }
}