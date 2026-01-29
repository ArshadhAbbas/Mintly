import 'package:flutter/services.dart';

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(' ', '');
    var buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonSpaceIndex = i + 1;
      if (nonSpaceIndex % 4 == 0 && nonSpaceIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  final String separator;

  CardExpirationFormatter({required this.separator});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    // 1. If user is deleting, just let it happen
    if (oldValue.text.length > newValue.text.length) {
      return newValue;
    }

    // 2. Remove any non-number characters to clean the input
    var cleanText = newText.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanText.length >= 2) {
      int month = int.parse(cleanText.substring(0, 2));
      if (month > 12) {
        // Return old value if month is invalid
        return oldValue;
      }
    }

    var buffer = StringBuffer();
    for (int i = 0; i < cleanText.length; i++) {
      buffer.write(cleanText[i]);
      var index = i + 1;
      // 3. Add separator after the 2nd digit (MM)
      if (index == 2 && index != cleanText.length) {
        buffer.write(separator);
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
