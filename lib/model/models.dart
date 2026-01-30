import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:mintly/model/bank_accounts_model.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/model/categories_model.dart';

@GenerateAdapters([AdapterSpec<CategoriesModel>(),AdapterSpec<CardModel>(), AdapterSpec<BankAccountsModel>()])
part 'models.g.dart';