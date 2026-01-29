import 'package:flutter/material.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/view/home/widgets/spend_action_button.dart';

class SpendActionButtonsList extends StatelessWidget {
  const SpendActionButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: context.isMobile ? null : context.screenWidth * 0.35,
        width: context.isMobile ? double.infinity : (context.screenWidth / 2) - 40,
        child: Flex(
          direction: context.isMobile ? Axis.horizontal : Axis.vertical,
          spacing: 5,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpendActionButton(
              isFilled: true,
              icon: Icon(Icons.arrow_upward_rounded, color: Colors.white, size: context.isMobile ? null : context.screenWidth / 50),
              buttonText: "Send",
              onTap: () {
                print("Send");
              },
            ),

            SpendActionButton(
              isFilled: false,
              icon: Icon(Icons.arrow_downward_rounded, size: context.isMobile ? null : context.screenWidth / 50),
              onTap: () {
                print("Receive");
              },
              buttonText: "Receive",
            ),

            SpendActionButton(
              isFilled: false,
              icon: Icon(Icons.call_split_rounded, size: context.isMobile ? null : context.screenWidth / 50),
              buttonText: "Split",
              onTap: () {
                print("Split");
              },
            ),
          ],
        ),
      ),
    );
  }
}
