import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';

class SpendActionButton extends StatelessWidget {
  const SpendActionButton({super.key, required this.isFilled, required this.icon, required this.onTap, required this.buttonText});
  final bool isFilled;
  final Icon icon;
  final Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  height: context.isMobile ? null : constraints.maxHeight - 25,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.isMobile ? 30 : 10,
                    vertical: context.isMobile ? 20 : constraints.maxWidth / 50,
                  ),
                  decoration: BoxDecoration(
                    color: isFilled ? Colors.black : null,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        icon,
                        SizedBox(height: 2),
                        Container(
                          height: 2,
                          width: 30,
                          decoration: BoxDecoration(color: isFilled ? Colors.white : Colors.black, borderRadius: BorderRadius.circular(30)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(buttonText, style: TextStyleConstants.w500F14),
            ],
          );
        },
      ),
    );
  }
}
