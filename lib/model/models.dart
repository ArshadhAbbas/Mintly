import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/model/categories_model/categories_model.dart';

@GenerateAdapters([AdapterSpec<CategoriesModel>(),AdapterSpec<CardModel>()])
part 'models.g.dart';