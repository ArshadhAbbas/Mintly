

import 'package:flutter/material.dart';

class AddCardDropDown<T> extends StatelessWidget {
  const AddCardDropDown({super.key, this.width, this.height, required this.dropdownMenuEntries, this.controller, this.hintText});

  final double? width, height;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      controller: controller,
      hintText: hintText,
      width: width ?? MediaQuery.of(context).size.width / 2.2,
      dropdownMenuEntries: dropdownMenuEntries,
      menuStyle: const MenuStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.white), elevation: WidgetStatePropertyAll(10)),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: const OutlineInputBorder(),
        constraints: BoxConstraints.tight(Size.fromHeight(height ?? 52)),
      ),
    );
  }
}
