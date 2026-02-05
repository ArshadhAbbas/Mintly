import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get longAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.isNegative) {
      return DateFormat('dd/MM/yy HH:mm').format(this);
    }

    if (difference.inHours < 24) {
      if (difference.inMinutes < 1) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      }
    }

    return DateFormat('dd/MM/yy HH:mm').format(this);
  }

  String get getMonth => DateFormat('MMMM').format(DateTime(0, month));
  String get getDay => DateFormat('EEEE').format(DateTime(year, month, day));
  String get getMinute => DateFormat('mm').format(DateTime(0, 0, 0, 0, minute));
}
