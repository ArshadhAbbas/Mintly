import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/model/categories_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_controller.g.dart';

@riverpod
class SelectedAccountChipController extends _$SelectedAccountChipController {
  @override
  AccountType? build() => null;

  void updateType(AccountType accountType) {
    state = accountType;
  }
}

@riverpod
class SelectedAccountOrCardNumber extends _$SelectedAccountOrCardNumber{
  @override
  String? build() => null;

  void updateAccountOrCardNumber(String accountNumber) {
    state = accountNumber;
  }
}

@riverpod
class SelectedTransactionCategory extends _$SelectedTransactionCategory{
  @override
  CategoriesModel? build() => null;

  void updateSelectedCategory(CategoriesModel category){
    state = category;
  }
}

@riverpod
class SelectedTransactionSubCategory extends _$SelectedTransactionSubCategory{
  @override
  CategoriesModel? build() => null;

  void updateSelectedSubCategory(CategoriesModel category){
    state = category;
  }
}