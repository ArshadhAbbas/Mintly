
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';

class DeletingPopUp extends StatelessWidget {
  const DeletingPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusGeometry.circular(35)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.appThemeYellow),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                child: Lottie.asset(Assets.animations.shredder.path, repeat: false, reverse: false, animate: true),
              ),
            ),
            SizedBox(height: 10),
            Text("Deleting..."),
            SizedBox(height: 20),
            // GestureDetector(
            //   onTap: () {
            //     context.pop();
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
            //     height: 40,
            //     width: double.infinity,
            //     child: Center(
            //       child: Text("Cancel", style: TextStyleConstants.w400F16.copyWith(color: Colors.white)),
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
