import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/banks_cards_controller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/string_constants.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/view/home/widgets/card_switch.dart';

class HomeScreenBankCard extends StatelessWidget {
  const HomeScreenBankCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                    HugeIcon(icon: HugeIcons.strokeRoundedBank),
                    Spacer(),
                    Text("Banks", style: TextStyleConstants.w600F12),
                  ],
                ),
                SizedBox(height: constraints.maxHeight / 16),
                Container(
                  padding: EdgeInsets.all(6),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final bool isShowing = ref.watch(banksCardsSwitchControllerProvider(index));
                      return Column(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Account Number",
                            style: TextStyleConstants.w400F10.copyWith(
                              color: Colors.black.withValues(alpha: 0.5),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                isShowing ? "4676567675757567" : "4676567675757567".starred,
                                style: TextStyleConstants.w700F16,
                              ),
                              Spacer(),
                              CardSwitch(
                                currentValue: isShowing,
                                onTap: () {
                                  ref
                                      .read(banksCardsSwitchControllerProvider(index).notifier)
                                      .updateSwitch();
                                },
                                thumbColor: Colors.black,
                                borderColor: Colors.black,
                              ),
                            ],
                          ),
                          // SizedBox(height: 5),
                          Divider(),
                          RichText(
                            text: TextSpan(
                              text: "IFSC: ",
                              style: TextStyleConstants.w400F12.copyWith(
                                color: Colors.black.withValues(alpha: 0.5),
                              ),
                              children: [
                                TextSpan(
                                  text: isShowing ? "HDFC123400" : "HDFC123400".starred,
                                  style: TextStyleConstants.w700F12.copyWith(
                                    color: Colors.black.withValues(alpha: 0.6),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Available Balance",
                      style: TextStyleConstants.w400F12.copyWith(color: Colors.black),
                    ),
                    Text("${StringConstants.rupeeIcon} 10000", style: TextStyleConstants.w600F16),
                  ],
                ),
                SizedBox(height: constraints.maxHeight / 15),
              ],
            ),
          ),
        );
      },
    );
  }
}
