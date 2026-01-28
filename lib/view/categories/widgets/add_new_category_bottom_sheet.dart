import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mintly/controller/categories_contoller.dart';
import 'package:mintly/utils/app_constants.dart/app_colors.dart';
import 'package:mintly/utils/app_constants.dart/icons_list.dart';
import 'package:mintly/utils/config/huge_icon_config.dart';
import 'package:mintly/utils/widgets/app_text_field.dart';

enum CategoryUpdate { edit, add }

class AddNewCategoryBottomSheet extends ConsumerStatefulWidget {
  const AddNewCategoryBottomSheet({super.key, required this.onDone, required this.updateType, this.updateText, this.updateIcon});
  final Function(String categoryName) onDone;
  final CategoryUpdate updateType;
  final String? updateText;
  final List<List<dynamic>>? updateIcon;

  @override
  ConsumerState<AddNewCategoryBottomSheet> createState() => _AddNewCategoryBottomSheetState();
}

class _AddNewCategoryBottomSheetState extends ConsumerState<AddNewCategoryBottomSheet> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.updateType == CategoryUpdate.edit && widget.updateText != null) {
        textEditingController.text = widget.updateText!;
      }
      if (widget.updateType == CategoryUpdate.edit && widget.updateIcon != null) {
        ref.read(selectedCategoryIconControllerProvider.notifier).updateSelectedCategoryIcon(HugeIconConfig.stringify(widget.updateIcon!));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(6),
          clipBehavior: Clip.antiAlias,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: theme.cardColor, borderRadius: const BorderRadius.all(Radius.circular(16.0))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHandle(context),
              SizedBox(height: 10),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: IconButton(
                  onPressed: () {
                    widget.onDone(textEditingController.text);
                    context.pop();
                  },
                  icon: HugeIcon(icon: HugeIcons.strokeRoundedCheckmarkCircle02),
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.appThemeYellow,
                    child: Consumer(
                      builder: (context, ref, child) {
                        final selectedIcon = ref.watch(selectedCategoryIconControllerProvider);
                        return HugeIcon(icon: HugeIconConfig.parse(selectedIcon));
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppTextField(hintText: "Category Name", textEditingController: textEditingController),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Consumer(
                builder: (context, ref, child) {
                  return Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(
                      iconsList.length,
                      (index) => GestureDetector(
                        onTap: () => ref
                            .read(selectedCategoryIconControllerProvider.notifier)
                            .updateSelectedCategoryIcon(HugeIconConfig.stringify(iconsList[index])),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: ref.watch(selectedCategoryIconControllerProvider) == HugeIconConfig.stringify(iconsList[index])
                                ? AppColors.appThemeYellow
                                : Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(child: HugeIcon(icon: iconsList[index])),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    final theme = Theme.of(context);

    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(color: theme.dividerColor, borderRadius: const BorderRadius.all(Radius.circular(2.5))),
        ),
      ),
    );
  }
}
