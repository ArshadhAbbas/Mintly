
import 'package:flutter/material.dart';
import 'package:mintly/view/home/widgets/spend_action_button.dart';

class SpendActionButtonsList extends StatelessWidget {
  const SpendActionButtonsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SpendActionButton(
            isFilled: true,
            icon: Icon(Icons.arrow_upward_rounded, color: Colors.white),
            buttonText: "Send",
            onTap: () {
              print("Send");
            },
          ),
      
          SpendActionButton(
            isFilled: false,
            icon: Icon(Icons.arrow_downward_rounded),
            onTap: () {
              print("Send");
            },
            buttonText: "Receive",
          ),
      
          SpendActionButton(
            isFilled: false,
            icon: Icon(Icons.call_split_rounded),
            buttonText: "Split",
            onTap: () {
              print("Split");
            },
          )
        ],
      ),
    );
  }
}
