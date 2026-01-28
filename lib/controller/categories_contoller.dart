import 'dart:async';

import 'package:hive_ce/hive_ce.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/model/categories_model/categories_model.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/categories/widgets/add_new_category_bottom_sheet.dart';
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

  void deleteCategory(String categoryId) {
    _box.delete(categoryId);
    state = AsyncValue.data(_box.values.toList());
  }

  void addOrEditSubCategory({
    required CategoryUpdate categoryUpdateType,
    required CategoriesModel category,
    required String newCategoryName,
    CategoriesModel? subCategory,
  }) {
    if (categoryUpdateType == CategoryUpdate.add) {
      final List<CategoriesModel> updatedSubCategories = [
        ...(category.subCategories ?? []),
        CategoriesModel(
          categoryId: newCategoryName.toLowerCase().replaceAll(" ", "_"),
          categoryName: newCategoryName.toTitleCase.trim(),
          categoryIcon: ref.read(selectedCategoryIconControllerProvider),
        ),
      ];
      addNewCategory(category.copyWith(subCategories: updatedSubCategories));
    } else {
      final updatedSubCategories = (category.subCategories ?? []).map((sub) {
        if (sub.categoryId == subCategory!.categoryId) {
          return sub.copyWith(
            categoryName: newCategoryName.toTitleCase.trim(),
            categoryIcon: ref.read(selectedCategoryIconControllerProvider),
          );
        }
        return sub;
      }).toList();
      addNewCategory(category.copyWith(subCategories: updatedSubCategories));
    }
  }

  void deleteSubCategory({required CategoriesModel category, required String subCategoryId}) {
    final updatedSubCategories = (category.subCategories ?? []).where((sub) => sub.categoryId != subCategoryId).toList();
    final updatedCategory = category.copyWith(subCategories: updatedSubCategories);
    _box.put(updatedCategory.categoryId, updatedCategory);
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
  CategoriesModel(
    categoryId: "groceries",
    categoryName: "Groceries",
    categoryIcon: HugeIconConfig.stringify(HugeIcons.strokeRoundedShoppingCart01),
  ),
  CategoriesModel(categoryId: "transport", categoryName: "Transport", categoryIcon: HugeIconConfig.stringify(HugeIcons.strokeRoundedCar04)),
];

@riverpod
class SelectedCategoryIconController extends _$SelectedCategoryIconController {
  @override
  String build() {
    return HugeIconConfig.stringify(HugeIcons.strokeRoundedMore02);
  }

  void updateSelectedCategoryIcon(String newIcon) {
    state = newIcon;
  }
}
