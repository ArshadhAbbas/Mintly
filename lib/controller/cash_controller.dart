import 'package:hive_ce/hive_ce.dart';
import 'package:mintly/model/cash_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_controller.g.dart';

@riverpod
class CashController extends _$CashController {
  late Box<CashModel> _box;

  @override
  List<CashModel> build() {
    _box = Hive.box<CashModel>(HiveBoxes.cashBox);
    return _box.values.toList();
  }

  void addCash(CashModel cash) {
    if (_box.isEmpty) {
      _box.add(cash);
    } else {
      _box.putAt(0, cash);
    }
    state = _box.values.toList();
  }

  Future<void> deleteCashAccount()async {
    await _box.clear();
    state = _box.values.toList();
  }
}
