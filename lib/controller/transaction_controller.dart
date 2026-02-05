import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/controller/bank_accounts_controller.dart';
import 'package:mintly/controller/cards_controller.dart';
import 'package:mintly/controller/cash_controller.dart';
import 'package:mintly/model/categories_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_controller.g.dart';

@riverpod
class SelectedAccountChipController extends _$SelectedAccountChipController {
  @override
  AccountType? build() {
    final banks = ref.watch(bankAccountsControllerProvider);
    final cards = ref.watch(cardsControllerProvider);
    final cash = ref.watch(cashControllerProvider);
    if (banks.isNotEmpty) return AccountType.bank;
    if (cards.isNotEmpty) return AccountType.cards;
    if (cash.isNotEmpty) return AccountType.cash;
    return null;
  }

  void updateType(AccountType accountType) {
    state = accountType;
  }
}

@riverpod
class SelectedAccountOrCardNumber extends _$SelectedAccountOrCardNumber {
  @override
  String? build() {
    final banks = ref.watch(bankAccountsControllerProvider);
    final cards = ref.watch(cardsControllerProvider);
    if (banks.isNotEmpty) return banks.first.accountNumber;
    if (cards.isNotEmpty) return cards.first.cardNumber;
    return null;
  }

  void updateAccountOrCardNumber(String accountNumber) {
    state = accountNumber;
  }
}

@riverpod
class SelectedTransactionCategory extends _$SelectedTransactionCategory {
  @override
  CategoriesModel? build() => null;

  void updateSelectedCategory(CategoriesModel category) {
    state = category;
  }
}

@riverpod
class SelectedTransactionSubCategory extends _$SelectedTransactionSubCategory {
  @override
  CategoriesModel? build() => null;

  void updateSelectedSubCategory(CategoriesModel category) {
    if (state == category) {
      state = null;
    } else {
      state = category;
    }
  }
}

@riverpod
class TransactionDescriptionController extends _$TransactionDescriptionController {
  @override
  String build() => "";

  void updateDescription(String description) {
    state = description;
  }
}

@riverpod
class TransactionDateTimeController extends _$TransactionDateTimeController {
  @override
  DateTime build() => DateTime.now();

  void updateDateAndTime(DateTime newDateAndTime) {
    if (newDateAndTime.isBefore(DateTime.now())) {
      state = newDateAndTime;
    }
  }
}
