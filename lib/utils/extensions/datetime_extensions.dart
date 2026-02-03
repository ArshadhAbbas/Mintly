import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get longAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    // Future dates (safety)
    if (difference.isNegative) {
      return DateFormat('dd/MM/yy HH:mm').format(this);
    }

    // Within last 24 hours → relative time
    if (difference.inHours < 24) {
      if (difference.inMinutes < 1) {
        return 'just now';
      } else if (difference.inMinutes < 60) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      }
    }

    // Older than 24 hours → date & time
    return DateFormat('dd/MM/yy HH:mm').format(this);
  }
}
