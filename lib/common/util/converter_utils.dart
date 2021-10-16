class ConverterUtils {
  static double cleanStringDouble(value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value;
    }
  }
}
