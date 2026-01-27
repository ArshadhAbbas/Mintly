
import 'dart:convert';

class HugeIconConfig {
  static String stringify(List<List<dynamic>> iconData) {
    return jsonEncode(iconData);
  }

  static List<List<dynamic>> parse(String iconString) {
    final decoded = jsonDecode(iconString) as List;
    return decoded.map((e) => e as List<dynamic>).toList();
  }
}
