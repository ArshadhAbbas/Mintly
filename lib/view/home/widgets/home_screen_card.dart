import 'package:card_scanner/models/card_issuer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/home/widgets/card_switch.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({super.key, required this.cardModel});
  final CardModel cardModel;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.appThemeYellow,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black, offset: Offset(5, 5))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: constraints.maxHeight / 10),

              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    if (cardModel.cardType != null)
                      CardIssuer.values
                          .firstWhere(
                            (element) =>
                                element.name.toLowerCase().replaceAll(" ", "") == cardModel.cardType?.toLowerCase().replaceAll(" ", ""),
                          )
                          .getCardIcon
                          else SizedBox(height: 20,)
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight / 6),
              Consumer(
                builder: (context, ref, child) {
                  final bool shouldShowText = ref.watch(cardSwitchControllerProvider);
                  return Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: context.screenWidth,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentGeometry.centerLeft,
                          child: Text(
                            shouldShowText
                                ? cardModel.cardNumber.splitStringByLength(splitLength: 4)
                                : cardModel.cardNumber.splitStringByLength(splitLength: 4).starred,
                            style: TextStyleConstants.w400F18.copyWith(color: Colors.white),
                          ),
                        ),
                        CardSwitch(),
                      ],
                    ),
                  );
                },
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Balance", style: TextStyleConstants.w400F12.copyWith(color: Colors.black)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${StringConstants.rupeeIcon} ${cardModel.balance}", style: TextStyleConstants.w600F16),
                        Text(cardModel.expiry, style: TextStyleConstants.w400F12),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight / 15),
            ],
          ),
        );
      },
    );
  }
}
