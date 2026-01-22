import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/card_switch_controller.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/card_extensions.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/home/widgets/card_switch.dart';

class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({super.key});

  @override
  Widget build(BuildContext context) {
    CardModel cardModel = CardModel(
      cardType: CardTypes.master,
      currency: CurrencyType.inr,
      balance: 100,
      expiry: "96/825",
      cardNumber: "100000000000",
    );
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.appThemeYellow,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: Colors.black, offset: Offset(5, 5))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
            child: Row(
              children: [
                cardModel.cardIcon,
                Spacer(),
                Text(cardModel.currency.name.toUpperCase(), style: TextStyleConstants.w600F14),
              ],
            ),
          ),
          SizedBox(height: 30),
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
          SizedBox(height: 40),
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
                    Text("${cardModel.currency.getCurrency}${cardModel.balance}", style: TextStyleConstants.w600F16),
                    Text(cardModel.expiry, style: TextStyleConstants.w400F12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
