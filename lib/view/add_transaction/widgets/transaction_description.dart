import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/transaction_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/string_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';

class TransactionDescription extends ConsumerWidget {
  const TransactionDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    final addedDescription = ref.watch(transactionDescriptionControllerProvider);
    if (addedDescription.isNotEmpty == true) {
      controller.text = addedDescription;
    }
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: .center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Description", style: TextStyleConstants.w500F18),
                          Spacer(),
                          InkWell(onTap: () => context.pop(), child: const Icon(Icons.close)),
                        ],
                      ),

                      const SizedBox(height: 12),

                      TextField(
                        controller: controller,
                        autofocus: true,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          isCollapsed: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: "Add Note",
                          filled: false,
                          border: InputBorder.none,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(onPressed: () => context.pop(), child: const Text("Cancel")),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: BlackButton(
                              margin: EdgeInsets.zero,
                              height: 40,
                              borderRadius: 30,
                              onTap: () {
                                ref.read(transactionDescriptionControllerProvider.notifier).updateDescription(controller.text.trim());
                                context.pop();
                              },
                              text: "Add Note",
                              textSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black.withValues(alpha: addedDescription.isEmpty ? 0.2 : 1)),
          ),
        ),
        child: Text(
          addedDescription.isNotEmpty ? addedDescription.toTitleCase : "Add Note",
          textAlign: TextAlign.center,
          style: TextStyleConstants.w500F14.copyWith(color: Colors.black.withValues(alpha: addedDescription.isEmpty ? 0.2 : 1)),
        ),
      ),
    );
  }
}
