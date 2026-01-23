import 'package:hugeicons/hugeicons.dart';
import 'package:hive_ce/hive_ce.dart';


@GenerateAdapters([AdapterSpec<CategoriesModel>()])
part 'categories_model.g.dart';

class CategoriesModel {
  int categoryId;
  String categoryName;
  HugeIcon categoryIcon;
  CategoriesModel({required this.categoryId, required this.categoryName, required this.categoryIcon});
}
