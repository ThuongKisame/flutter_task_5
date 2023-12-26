class Validator {
  static String? userName(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (value.length < 1 || value.length > 30) {
      return 'Length should be between 1 and 30 characters';
    } else if (value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return 'Special characters are not allowed';
    } else if (value.contains(RegExp(r'[^\x00-\x7F\u0111\u0110\u00E0-\u1EF3]+'))) {
      return 'Emoji is not allowed';
    } else if (value.contains(' ')) {
      return 'Whitespace is not allowed';
    }
    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least 1 uppercase letter';
    } else if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least 1 special character';
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least 1 digit';
    }
    return null;
  }

  static String? name(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    } else if (value.contains(RegExp(r'[^\x00-\x7F\u0111\u0110\u00E0-\u1EF3]+'))) {
      return 'Emoji is not allowed';
    }

    return null;
  }

  static String? email(String value) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

    if (value.isEmpty) {
      return 'Please enter an email address';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email format';
    }

    return null;
  }
}
