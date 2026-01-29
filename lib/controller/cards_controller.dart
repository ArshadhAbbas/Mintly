import 'package:hive_ce/hive_ce.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_controller.g.dart';

@riverpod
class CardsController extends _$CardsController {
  late Box<CardModel> _box;

  @override
  List<CardModel> build() {
    _box = Hive.box<CardModel>(HiveBoxes.cardsBox);
    return _box.values.toList();
  }

  void addNewCard(CardModel newCard) {
    _box.put(newCard.cardId, newCard);
    state = _box.values.toList();
  }

  void deleteCard(int cardId) {
    _box.delete(cardId);
    state = _box.values.toList();
  }
}
