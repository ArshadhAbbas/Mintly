import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class HomeScreenCashCard extends StatelessWidget {
  const HomeScreenCashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isMobile ? null : context.screenWidth * 0.25,
      width: context.isMobile ? double.infinity : context.screenWidth / 2,
      child: CarouselSlider.builder(
        options: CarouselOptions(viewportFraction: 1, autoPlay: false, enableInfiniteScroll: false),
        itemCount: 1,
        itemBuilder: (context, index, realIndex) => LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: AppColors.appThemeYellow, width: 3),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black, offset: Offset(5, 5))],
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(height: constraints.maxHeight / 16),

                    Row(
                      children: [
                        HugeIcon(icon: HugeIcons.strokeRoundedMoney03),
                        Spacer(),
                        Text("Cash", style: TextStyleConstants.w600F12),
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight / 8),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: .start,
                            crossAxisAlignment: .start,
                            children: [
                              Text(
                                "Physical Cash",
                                style: TextStyleConstants.w400F10.copyWith(
                                  color: Colors.black.withValues(alpha: 0.5),
                                ),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text("Last Updated: Today", style: TextStyleConstants.w600F14),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(border: Border.all(color:AppColors.appThemeGreen),borderRadius: BorderRadius.circular(8)),
                            padding: EdgeInsets.all(5),
                            child: HugeIcon(icon: HugeIcons.strokeRoundedCash01,color: AppColors.appThemeGreen),
                          )
                        ],
                      ),
                    ),
                    Spacer(),

                    Text(
                      "Cash in Hand",
                      style: TextStyleConstants.w400F12.copyWith(color: Colors.black),
                    ),
                    Text("${StringConstants.rupeeIcon} 10000", style: TextStyleConstants.w600F16),

                    SizedBox(height: constraints.maxHeight / 15),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
