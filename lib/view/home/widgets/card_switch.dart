import 'package:flutter/material.dart';


class CardSwitch extends StatelessWidget {
  const CardSwitch({super.key, required this.onTap, this.thumbColor, this.borderColor, required this.currentValue});
  final bool currentValue;
  final Function() onTap;
  final Color? thumbColor,borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 30,
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(color:borderColor?? Colors.white)),
        child: AnimatedAlign(
          alignment: currentValue ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
          duration: Duration(milliseconds: 100),
          child: Container(height: 20,width: 20,decoration: BoxDecoration(color:thumbColor?? Colors.white,shape: BoxShape.circle),),
        ),
      ),
    );
  }
}
