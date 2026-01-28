import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class CategoryPopupMenu extends StatelessWidget {
  const CategoryPopupMenu({super.key, this.child, required this.update, required this.delete});
  final Widget? child;
  final Function() update, delete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsetsGeometry.all(5),
      menuPadding: EdgeInsetsGeometry.all(5),
      tooltip: "Options",
      constraints: BoxConstraints(maxHeight: 70, maxWidth: 100),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "edit",
          height: 10,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          onTap: update,
          child: Center(child: Text("Edit", style: TextStyleConstants.w400F12)),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: "delete",
          height: 10,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Center(
            child: Text("Delete", style: TextStyleConstants.w400F12.copyWith(color: Colors.red)),
          ),
        ),
      ],
      child: child ?? HugeIcon(icon: HugeIcons.strokeRoundedMoreVerticalCircle01, size: 18),
    );
  }
}
