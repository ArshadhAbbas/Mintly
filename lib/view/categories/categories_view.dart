import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/model/categories_model/categories_model.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';

class CategoriesView extends ConsumerWidget {
  static String path = "/categories_view";
  static String pathName = "categories_view";
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: switch (ref.watch(categoriesControllerProvider)) {
        AsyncLoading() => CircularProgressIndicator(),
        AsyncError(:final error, hasError: true) => Text(error.toString()),
        AsyncValue(:final value) => ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) => InkWell(
            onTap: () => ref.read(categoriesControllerProvider.notifier).deleteCategory(value[index]),
            child: Row(
              mainAxisAlignment: .start,
              crossAxisAlignment: .center,
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.appThemeYellow),
                  child: Center(child: HugeIcon(icon: HugeIconConfig.parse(value[index].categoryIcon))),
                ),
                SizedBox(width: 10),
                Text(value[index].categoryName, style: TextStyleConstants.w400F16),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 15),
          itemCount: value!.length,
        ),
      },
      floatingActionButton: switch (ref.watch(categoriesControllerProvider)) {
        AsyncLoading() => CircularProgressIndicator(),
        AsyncError(:final error, hasError: true) => Text(error.toString()),
        AsyncValue(:final value) => FloatingActionButton(
          onPressed: () {
            ref
                .read(categoriesControllerProvider.notifier)
                .addNewCategory(
                  CategoriesModel(
                    categoryId: (value?.isNotEmpty == true) ? value!.last.categoryId + 1 : 1,
                    categoryName: "Text1",
                    categoryIcon: HugeIconConfig.stringify(HugeIcons.strokeRoundedAddCircleHalfDot),
                  ),
                );
          },
        ),
      },
    );
  }
}
