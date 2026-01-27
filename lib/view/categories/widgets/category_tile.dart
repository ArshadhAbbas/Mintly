import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.categoryName, required this.categoryIcon, this.onTap, this.onLongPress, this.action});
  final String categoryName;
  final String categoryIcon;
  final Function()? onTap, onLongPress;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.appThemeYellow),
              child: Center(child: HugeIcon(icon: HugeIconConfig.parse(categoryIcon))),
            ),
            SizedBox(width: 10),
            Text(categoryName.toTitleCase, style: TextStyleConstants.w400F16),
            Spacer(),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
