class ApiConstants {
  static const String requireUsernameLength = 'Length should be between 1 and 30 characters';
  static const String requireNotAllowedCharacter = 'Special characters are not allowed';
  static const String requireNotAllowedEmoji = 'Emoji is not allowed';
  static const String requireNotAllowedWhitespace = 'Whitespace is not allowed';
  static const String requirePasswordLength = 'Password must be at least 8 characters long';
  static const String requirePasswordUppercase = 'Password must contain at least 1 uppercase letter';
  static const String requirePasswordSpecialCharacter = 'Password must contain at least 1 special character';
  static const String requirePasswordDigit = 'Password must contain at least 1 digit';
  static const String invalidEmailFormat = 'Invalid email format';
  static RegExp regExpNotAllowedEmoji = RegExp(r'[^\x00-\x7F\u0111\u0110\u00E0-\u1EF3]+');
}
