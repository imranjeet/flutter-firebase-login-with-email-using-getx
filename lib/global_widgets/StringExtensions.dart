import 'dart:convert';

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}
extension StringExtension on String? {
  static String urlPattern =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';

  static String phonePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  /// Check email validation
  bool validateEmail() => hasMatch(this, emailPattern);

  /// Check phone validation
  bool validatePhone() => hasMatch(this, phonePattern);

  /// Check URL validation
  bool validateURL() => hasMatch(this, urlPattern);

  /// Returns true if given String is null or isEmpty
  bool get isEmptyOrNull => this == null || (this != null && this!.isEmpty) || (this != null && this! == 'null');

  /// Capitalize given String
  String capitalizeFirstLetter() => (validate().length >= 1) ? (this!.substring(0, 1).toUpperCase() + this!.substring(1).toLowerCase()) : validate();

  // Check null string, return given value if null
  String validate({String value = ''}) {
    if (this.isEmptyOrNull) {
      return value;
    } else {
      return this!;
    }
  }

  bool isJson() {
    try {
      json.decode(this.validate());
    } catch (e) {
      return false;
    }
    return true;
  }
}
