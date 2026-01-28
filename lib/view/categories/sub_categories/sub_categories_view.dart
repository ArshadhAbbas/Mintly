import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/model/categories_model/categories_model.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:mintly/view/categories/widgets/add_new_category_bottom_sheet.dart';
import 'package:mintly/view/categories/widgets/category_popup_menu.dart';
import 'package:mintly/view/categories/widgets/category_tile.dart';
import 'package:mintly/view/categories/widgets/deleting_popup.dart';

class SubCategoriesView extends ConsumerWidget {
  static String path = "/sub_categories/:$categoryIdParam";
  static String pathName = "sub_categories";
  static final String categoryIdParam = "category_id";

  const SubCategoriesView({super.key, required this.categoryId});
  final String categoryId;
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer? deleteTimer;
    final categoriesAsync = ref.watch(categoriesControllerProvider);
    return categoriesAsync.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(appBar: AppBar(), body: Text(e.toString())),
      data: (categories) {
        final category = categories.firstWhere((c) => c.categoryId == categoryId);
        return Scaffold(
          appBar: AppBar(
            title: Text(category.categoryName),
            actions: [
              if (category.subCategories != null && category.subCategories!.isNotEmpty)
                IconButton(
                  onPressed: () {
                    showAddSubCategorySheet(context: context, category: category, categoryUpdateType: CategoryUpdate.add);
                  },
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedResourcesAdd),
                ),
              CategoryPopupMenu(
                child: HugeIcon(icon: HugeIcons.strokeRoundedMoreHorizontalCircle01),
                delete: () {
                  context.pop("Delete");
                },
                update: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    useSafeArea: true,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Consumer(
                      builder: (context, ref, child) {
                        return AddNewCategoryBottomSheet(
                          updateType: CategoryUpdate.edit,
                          updateText: category.categoryName,
                          updateIcon: HugeIconConfig.parse(category.categoryIcon),
                          onDone: (newCategoryName) {
                            ref
                                .read(categoriesControllerProvider.notifier)
                                .addNewCategory(
                                  category.copyWith(
                                    categoryName: newCategoryName,
                                    categoryIcon: ref.read(selectedCategoryIconControllerProvider),
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              SizedBox(width: 10),
            ],
          ),
          body: category.subCategories == null || category.subCategories!.isEmpty
              ? Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () => showAddSubCategorySheet(context: context, category: category, categoryUpdateType: CategoryUpdate.add),
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
                              text: "No subcategories, ",
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
                    categoryName: category.subCategories![index].categoryName,
                    categoryIcon: category.subCategories![index].categoryIcon,
                    action: CategoryPopupMenu(
                      delete: () {
                        showDialog(fullscreenDialog: false, context: context, builder: (context) => DeletingPopUp());
                        Future.delayed(Duration(seconds: 2), () {
                          ref
                              .read(categoriesControllerProvider.notifier)
                              .deleteSubCategory(category: category, subCategoryId: category.subCategories![index].categoryId);
                          context.pop();
                        });
                      },
                      update: () {
                        showAddSubCategorySheet(
                          context: context,
                          category: category,
                          categoryUpdateType: CategoryUpdate.edit,
                          subCategory: category.subCategories![index],
                        );
                      },
                    ),
                  ),
                  itemCount: category.subCategories!.length,
                ),
        );
      },
    );
  }

  dynamic showAddSubCategorySheet({
    required BuildContext context,
    required CategoriesModel category,
    required CategoryUpdate categoryUpdateType,
    CategoriesModel? subCategory,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (context) => Consumer(
        builder: (context, ref, child) {
          return AddNewCategoryBottomSheet(
            updateText: categoryUpdateType == CategoryUpdate.edit ? subCategory?.categoryName : null,
            updateIcon: categoryUpdateType == CategoryUpdate.edit ? HugeIconConfig.parse(subCategory!.categoryIcon) : null,
            updateType: categoryUpdateType,
            onDone: (newCategoryName) {
              ref
                  .read(categoriesControllerProvider.notifier)
                  .addOrEditSubCategory(
                    categoryUpdateType: categoryUpdateType,
                    category: category,
                    newCategoryName: newCategoryName,
                    subCategory: subCategory,
                  );
            },
          );
        },
      ),
    );
  }
}
