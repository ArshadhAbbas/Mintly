import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'banks_cards_controller.g.dart'; 

@riverpod
class BanksCardsSwitchController extends _$BanksCardsSwitchController{
  bool build()=>false;
  void updateSwitch(){
    state=!state;
  }

}

@riverpod
class BankCardsIndicatorController extends _$BankCardsIndicatorController{
  int build()=>0;
  void updateCardIndicator(int newIndex){
    state= newIndex;
  }
}