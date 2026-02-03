import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class AddNewAccountCard extends StatelessWidget {
  const AddNewAccountCard({super.key, required this.onTap, });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(color: AppColors.appThemeYellow, width: 3),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.black, offset: Offset(5, 5))],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                HugeIcon(icon: HugeIcons.strokeRoundedAddCircle, size: 35),
                SizedBox(height: 10),
                Center(child: Text("Add New", style: TextStyleConstants.w400F14)),
              ],
            ),
          ),
        );
      },
    );
  }
}
