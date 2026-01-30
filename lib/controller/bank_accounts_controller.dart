
import 'package:hive_ce/hive.dart';
import 'package:mintly/model/bank_accounts_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_accounts_controller.g.dart';  

@riverpod
class BankAccountsController extends _$BankAccountsController {
  late Box<BankAccountsModel> _box;

  @override
  List<BankAccountsModel> build() {
    _box = Hive.box<BankAccountsModel>(HiveBoxes.banksBox);
    return _box.values.toList();
  }

  void addNewBank(BankAccountsModel newBank) {
    _box.put(newBank.id, newBank);
    state = _box.values.toList();
  }

  void deleteBank(int bankId) {
    _box.delete(bankId);
    state = _box.values.toList();
  }
}
