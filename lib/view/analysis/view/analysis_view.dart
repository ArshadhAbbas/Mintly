import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      children: [
        Center(child: Text("Analysis", style: TextStyleConstants.w600F24)),
        SizedBox(height: 10),

        Consumer(
          builder: (context, ref, child) {
            return switch (ref.watch(categoriesControllerProvider)) {
              AsyncLoading() => CircularProgressIndicator(),
              AsyncError(:final error, hasError: true) => Text(error.toString()),
              AsyncValue(:final value) => Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
                        child: Center(child:HugeIcon(icon: HugeIconConfig.parse(value[index].categoryIcon))),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: .spaceBetween,
                          crossAxisAlignment: .start,
                          spacing: 10,
                          children: [
                            Text(value[index].categoryName, style: TextStyleConstants.w500F16),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: index % 2 != 0 ? 100 : 50,
                              height: 10,
                              decoration: BoxDecoration(color: AppColors.appThemeYellow, borderRadius: BorderRadius.circular(10)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        spacing: 4,

                        mainAxisAlignment: .spaceBetween,
                        crossAxisAlignment: .end,
                        children: [
                          Text("${StringConstants.rupeeIcon}32145", style: TextStyleConstants.w500F16),
                          Text("32%", style: TextStyleConstants.w400F12),
                        ],
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 15),
                  itemCount: value!.length,
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                ),
              ),
            };
          },
        ),
      ],
    );
  }
}
