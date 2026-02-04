import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/gen/assets.gen.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/media_query_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/view/accounts/accounts_view.dart';

extension BuildcontextExtensions on BuildContext {
  void showSnackBar(String content) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Center(child: Text(content))));

  void showDialogue({String? title, required String content, List<Widget>? actions}) {
    showDialog(
      context: this,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: screenWidth),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: AppColors.appThemeYellow, shape: BoxShape.circle),
                  child: SvgPicture.asset(Assets.general.mintly.path, height: 30, width: 30),
                ),
                const SizedBox(height: 12),
                if (title != null) ...[Text(title, style: TextStyleConstants.w600F18), const SizedBox(height: 10)],
                Text(content, style: TextStyleConstants.w400F16, textAlign: TextAlign.center),
                if (actions != null) ...[
                  const SizedBox(height: 20),
                  Row(spacing: 6, children: actions.map((e) => Expanded(child: e)).toList()),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void get showCreateAccountDialogue => showDialogue(
    content: "You haven't added any accounts yet.",
    title: "Create Account",
    actions: [
      OutlinedButton(
        onPressed: () {
          pop();
        },
        child: Text("Cancel"),
      ),
      BlackButton(
        onTap: () {
          pop();
          pushNamed(AccountsView.pathName);
        },
        text: "Create",
        borderRadius: 30,
        height: 40,
        margin: EdgeInsets.zero,
      ),
    ],
  );
}
