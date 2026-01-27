import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/view/categories/sub_categories/sub_categories_view.dart';
import 'package:mintly/view/categories/widgets/category_tile.dart';

class CategoriesView extends ConsumerWidget {
  static String path = "/categories_view";
  static String pathName = "categories_view";
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: switch (ref.watch(categoriesControllerProvider)) {
        AsyncLoading() => CircularProgressIndicator(),
        AsyncError(:final error, hasError: true) => Text(error.toString()),
        AsyncValue(:final value) => ListView.builder(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => CategoryTile(
            categoryIcon: value[index].categoryIcon,
            categoryName: value[index].categoryName,
            action: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, size: 14),
            onTap: () => context.pushNamed(
              SubCategoriesView.pathName,
              pathParameters: {SubCategoriesView.categoryIdParam: value[index].categoryId.toString()},
            ),
            onLongPress: () => print(value[index].categoryName),
          ),
          itemCount: value!.length,
        ),
      },
    );
  }
}
