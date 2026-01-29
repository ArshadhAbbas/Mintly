import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/controller/accounts_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';

class AccountSelectChip extends StatelessWidget {
  const AccountSelectChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedAccountType = ref.watch(selectedAccountsControllerProvider);
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            spacing: 10,
            children: List.generate(
              AccountType.values.length,
              (index) => GestureDetector(
                onTap: () => ref
                    .read(selectedAccountsControllerProvider.notifier)
                    .updateSelectedAccountType(accountType: AccountType.values[index]),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: selectedAccountType == AccountType.values[index] ? Colors.black : null,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      AccountType.values[index].name.toTitleCase,
                      style: TextStyleConstants.w500F14.copyWith(
                        color: selectedAccountType == AccountType.values[index]
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
