import 'package:hive_ce/hive_ce.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/model/categories_model/categories_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_contoller.g.dart';

@riverpod
class CategoriesController extends _$CategoriesController {
  late Box<CategoriesModel> _box;

  @override
  Future<List<CategoriesModel>> build() async {
    await seedCategoriesIfNeeded(ref);
    _box = Hive.box<CategoriesModel>(HiveBoxes.categoriesBox);
    return _box.values.toList();
  }

  void addNewCategory(CategoriesModel newCategory) {
    _box.put(newCategory.categoryId, newCategory);
    state = AsyncValue.data(_box.values.toList());
  }

  void deleteCategory(CategoriesModel category) {
    _box.delete(category.categoryId);
    state = AsyncValue.data(_box.values.toList());
  }
}

@riverpod
Future<void> seedCategoriesIfNeeded(Ref ref) async {
  final box = Hive.box<CategoriesModel>(HiveBoxes.categoriesBox);

  if (box.isEmpty) {
    for (final category in categoriesListInit) {
      await box.put(category.categoryId, category);
    }
  }
}

List<CategoriesModel> categoriesListInit = [
  CategoriesModel(categoryId: 0, categoryName: "Groceries", categoryIcon:HugeIconConfig.stringify(HugeIcons.strokeRoundedShoppingCart01)),

  CategoriesModel(categoryId: 1, categoryName: "Transport", categoryIcon: HugeIconConfig.stringify(HugeIcons.strokeRoundedCar04)),
];
