import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'accounts_controller.g.dart';

@riverpod
class SelectedAccountsController extends _$SelectedAccountsController {
  @override
  AccountType build() {
    return AccountType.cards;
  }

  void updateSelectedAccountType({required AccountType accountType}) {
    state = accountType;
  }
}

enum AccountType { cards, bank, cash }
