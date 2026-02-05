import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/view/accounts/accounts_view.dart';

class AddAccountChip extends StatelessWidget {
  const AddAccountChip({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AccountsView.pathName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all()),
        child: Text("+"),
      ),
    );
  }
}
