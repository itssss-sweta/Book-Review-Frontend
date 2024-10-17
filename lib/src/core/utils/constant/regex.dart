/// Regular expressions for common patterns.
extension ValidateRegExp on String {
  /// Regular expression to match any character except numbers.
  bool get isExceptNumber => RegExp(r'[^0-9]').hasMatch(this);

  /// Regular expression to match lower case alphabets only.
  bool get isLowerCaseOnly => RegExp(r'[a-z]').hasMatch(this);

  /// Regular expression to match upper case alphabets only.
  bool get isUpperCaseOnly => RegExp(r'[A-Z]').hasMatch(this);

  /// Regular expression to match numbers only.
  bool get isNumberOnly => RegExp(r'[0-9]').hasMatch(this);

  /// Regular expression to match special characters only.
  bool get isSpecialCharactersOnly => RegExp(r'[^\w\s]').hasMatch(this);

  /// Regular expression to match email format.
  bool get isEmailValid =>
      RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+$').hasMatch(this);

  /// Regular expression to match the name format.
  bool get isNameValid => RegExp(r'^[a-zA-Z]+').hasMatch(this);
}

/// Extension to string to check nullable and empty string.
extension IsNullOrEmptyExtension on String? {
  /// Method to check whether the input is null or empty.
  /// Return true any one of the condition is validated otherwise false.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
