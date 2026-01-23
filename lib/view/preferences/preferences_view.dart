import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      children: [
        Center(child: Text("Preferences", style: TextStyleConstants.w600F24)),
        SizedBox(height: 10),
      ],
    );
  }
}
