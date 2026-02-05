import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/controller/transaction_controller.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/extensions/datetime_extensions.dart';
import 'package:mintly/utils/widgets/black_button.dart';

class TransactionDateTime extends ConsumerWidget {
  const TransactionDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(transactionDateTimeControllerProvider);
    final selectedDateNotifier = ref.read(transactionDateTimeControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: .center,
        children: [
          InkWell(
            onTap: () {
              selectedDateNotifier.updateDateAndTime(selectedDate.subtract(Duration(days: 1)));
            },
            child: Icon(Icons.arrow_back_ios_rounded, size: 14),
          ),
          InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (context) => Center(
                child: Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Consumer(
                          builder: (context, ref, child) {
                            final selectedDateLocal = ref.watch(transactionDateTimeControllerProvider);

                            return Column(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .start,
                              mainAxisSize: .min,
                              children: [
                                Text(selectedDateLocal.getDay, style: TextStyleConstants.w500F18),
                                SizedBox(height: 10),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => _selectDate(
                                    context: context,
                                    selectedDateNotifier: selectedDateNotifier,
                                    selectedDate: selectedDateLocal,
                                  ),

                                  child: Row(
                                    mainAxisAlignment: .center,
                                    crossAxisAlignment: .center,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth - 50,
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "${selectedDateLocal.day}/${selectedDateLocal.getMonth}/${selectedDateLocal.year}",
                                          style: TextStyleConstants.w400F16,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                                          color: Colors.black,
                                        ),
                                        child: Center(child: Icon(Icons.calendar_month_outlined, size: 23, color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 10),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => _selectTime(
                                    context: context,
                                    selectedDateNotifier: selectedDateNotifier,
                                    selectedDate: selectedDateLocal,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: .center,
                                    crossAxisAlignment: .center,
                                    children: [
                                      Container(
                                        width: constraints.maxWidth - 50,
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                                        ),
                                        child: Text(
                                          "${selectedDateLocal.hour}:${selectedDateLocal.getMinute}",
                                          style: TextStyleConstants.w400F16,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
                                          color: Colors.black,
                                        ),
                                        child: Center(child: Icon(Icons.alarm, size: 23, color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Align(
                                  alignment: AlignmentGeometry.bottomRight,
                                  child: BlackButton(
                                    onTap: () => context.pop(),
                                    text: "OK",
                                    borderRadius: 30,
                                    margin: EdgeInsets.zero,
                                    height: 40,
                                    width: 80,
                                    textSize: 16,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            child: Text(
              "${selectedDate.day} ${selectedDate.getMonth} ${selectedDate.year}, ${selectedDate.hour}:${selectedDate.getMinute}",
              style: TextStyleConstants.w600F12,
            ),
          ),
          InkWell(
            onTap: () {
              selectedDateNotifier.updateDateAndTime(selectedDate.add(Duration(days: 1)));
            },
            child: Icon(Icons.arrow_forward_ios_rounded, size: 14),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate({
    required BuildContext context,
    required TransactionDateTimeController selectedDateNotifier,
    required DateTime selectedDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 3650)),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedDateNotifier.updateDateAndTime(pickedDate.copyWith(hour: selectedDate.hour, minute: selectedDate.minute));
    }
  }

  Future<void> _selectTime({
    required BuildContext context,
    required TransactionDateTimeController selectedDateNotifier,
    required DateTime selectedDate,
  }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      builder: (context, child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!);
      },
      initialTime: TimeOfDay(hour: selectedDate.hour, minute: selectedDate.minute),
    );

    if (pickedTime != null) {
      selectedDateNotifier.updateDateAndTime(selectedDate.copyWith(hour: pickedTime.hour, minute: pickedTime.minute));
    }
  }
}
