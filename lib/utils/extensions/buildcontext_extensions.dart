import 'package:flutter/material.dart';

extension BuildcontextExtensions on BuildContext {
  void showSnackBar(String content) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Center(child: Text(content))));
}
