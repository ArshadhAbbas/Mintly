import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/controller/transaction_controller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:mintly/view/categories/categories_view.dart';

class SelectCategoriesChips extends StatelessWidget {
  const SelectCategoriesChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer(
        builder: (context, ref, _) {
          final categories = ref.watch(categoriesControllerProvider);
          final selectedCategory = ref.watch(selectedTransactionCategoryProvider);
          final selectedSubCategory = ref.watch(selectedTransactionSubCategoryProvider);
          final hasSubCategories = selectedCategory?.subCategories?.isNotEmpty ?? false;

          return SizedBox(
            width: double.infinity,
            height: hasSubCategories ? 115 : 85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Categories", style: TextStyleConstants.w600F16),
                    Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () => context.pushNamed(CategoriesView.pathName),
                      child: SizedBox(height: 30, width: 30, child: Icon(Icons.arrow_forward_ios_rounded, size: 16)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  height: 36,
                  child: categories.when(
                    data: (data) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 6),
                      itemBuilder: (context, index) {
                        final category = data[index];
                        final isSelected = category == selectedCategory;

                        return GestureDetector(
                          onTap: () => ref.read(selectedTransactionCategoryProvider.notifier).updateSelectedCategory(category),
                          child: CategoryChip(
                            categoryIcon: category.categoryIcon,
                            text: category.categoryName,
                            color: isSelected ? AppColors.appThemeYellow : null,
                          ),
                        );
                      },
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),

                if (hasSubCategories) ...[
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedCategory!.subCategories!.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 6),
                      itemBuilder: (context, index) {
                        final sub = selectedCategory.subCategories![index];

                        return GestureDetector(
                          onTap: () => ref.read(selectedTransactionSubCategoryProvider.notifier).updateSelectedSubCategory(sub),
                          child: CategoryChip(
                            categoryIcon: sub.categoryIcon,
                            text: sub.categoryName,
                            color: sub == selectedSubCategory ? AppColors.appThemeYellow : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({super.key, required this.categoryIcon, required this.text, this.color});

  final String categoryIcon, text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColors.appThemeYellow),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          HugeIcon(icon: HugeIconConfig.parse(categoryIcon), size: 16),
          SizedBox(width: 5),
          Text(text, style: TextStyleConstants.w500F14),
        ],
      ),
    );
  }
}
