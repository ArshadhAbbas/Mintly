import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/model/categories_model.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/categories/sub_categories/sub_categories_view.dart';
import 'package:mintly/view/categories/widgets/add_new_category_bottom_sheet.dart';
import 'package:mintly/view/categories/widgets/category_tile.dart';

class CategoriesView extends ConsumerWidget {
  static String path = "/categories_view";
  static String pathName = "categories_view";
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: switch (ref.watch(categoriesControllerProvider)) {
        AsyncLoading() => CircularProgressIndicator(),
        AsyncError(:final error, hasError: true) => Text(error.toString()),
        AsyncValue(:final value) => Scaffold(
          appBar: AppBar(
            title: Text("Categories"),
            actions: [
              IconButton(
                onPressed: () {
                  showAddCategorySheet(context: context);
                },
                icon: HugeIcon(icon: HugeIcons.strokeRoundedResourcesAdd),
              ),
            ],
          ),
          body: value == null || value.isEmpty
              ? Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => showAddCategorySheet(context: context),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 14,
                        children: [
                          HugeIcon(icon: HugeIcons.strokeRoundedResourcesAdd, size: 35, color: Colors.blue),
                          RichText(
                            text: TextSpan(
                              text: "No Categories, ",
                              style: TextStyleConstants.w400F14.copyWith(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Add Some",
                                  style: TextStyleConstants.w500F14.copyWith(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) => CategoryTile(
                    categoryIcon: value[index].categoryIcon,
                    categoryName: value[index].categoryName,
                    action: HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01, size: 14),
                    onTap: () async {
                      final String? result = await context.pushNamed(
                        SubCategoriesView.pathName,
                        pathParameters: {SubCategoriesView.categoryIdParam: value[index].categoryId},
                      );
                      if (result != null && result == "Delete") {
                        Future.delayed(
                          Duration(milliseconds: 500),
                          () => ref.read(categoriesControllerProvider.notifier).deleteCategory(value[index].categoryId),
                        );
                      }
                    },
                    onLongPress: () => print(value[index].categoryName),
                  ),
                  itemCount: value.length,
                ),
        ),
      },
    );
  }

  dynamic showAddCategorySheet({required BuildContext context}) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          return AddNewCategoryBottomSheet(
            updateType: CategoryUpdate.add,
            onDone: (newCategoryName) {
              ref
                  .read(categoriesControllerProvider.notifier)
                  .addNewCategory(
                    CategoriesModel(
                      categoryId: newCategoryName.toLowerCase().replaceAll(" ", "_"),
                      categoryName: newCategoryName.toTitleCase,
                      categoryIcon: ref.read(selectedCategoryIconControllerProvider),
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
