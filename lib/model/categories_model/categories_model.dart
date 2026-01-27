import 'package:hive_ce/hive_ce.dart';

@GenerateAdapters([AdapterSpec<CategoriesModel>()])
part 'categories_model.g.dart';

class CategoriesModel {
  String categoryId;
  String categoryName;
  String categoryIcon;
  List<CategoriesModel>? subCategories;
  CategoriesModel({required this.categoryId, required this.categoryName, required this.categoryIcon, this.subCategories});

  CategoriesModel copyWith({String? categoryId, String? categoryName, String? categoryIcon, List<CategoriesModel>? subCategories}) {
    return CategoriesModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      subCategories: subCategories ?? this.subCategories,
    );
  }
}
