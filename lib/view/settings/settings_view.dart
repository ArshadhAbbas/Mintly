import 'package:flutter/material.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      children: [
        Center(child: Text("Settings", style: TextStyleConstants.w600F24)),
        SizedBox(height: 10),
        Center(
          child: Text("Manage Your Preferences", style: TextStyleConstants.w400F14.copyWith(color: Colors.black.withValues(alpha: 0.5))),
        ),
      ],
    );
  }
}
