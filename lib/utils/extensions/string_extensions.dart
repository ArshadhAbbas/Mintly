extension StringExtensions on String {
  String splitStringByLength({required int splitLength}) {
    List<String> result = [];
    for (int i = 0; i < length; i += splitLength) {
      int endIndex = i + splitLength;
      if (endIndex > length) {
        endIndex = length;
      }
      result.add(substring(i, endIndex));
      if (i % splitLength == 0) {
        result.add(" ");
      }
    }
    return result.join();
  }

  String get starred {
    List result = [];
    for (int i = 0; i < length; i++) {
      if (this[i] == " ") {
        result.add(" ");
      } else {
        result.add("*");
      }
    }
    return result.join();
  }
}
