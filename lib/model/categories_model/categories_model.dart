import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<CategoriesModel>()])
part 'categories_model.g.dart';

class CategoriesModel {
  int categoryId;
  String categoryName;
  String categoryIcon;
  CategoriesModel? subCategory;
  CategoriesModel({required this.categoryId, required this.categoryName, required this.categoryIcon, this.subCategory});

  @override
  String toString() => 'CategoriesModel(categoryId: $categoryId, categoryName: $categoryName, categoryIcon: $categoryIcon)';
}
