import 'package:flutter_task_5/constants/api_constants.dart';

class Validator {
  static String? checkEmpty(String value, String fieldName) {
    if (value.isEmpty) {
      return 'Please enter a $fieldName';
    }
    return null;
  }

  static String? userName(String value) {
    String? checkEmptyResult = checkEmpty(value, 'user name');
    if (checkEmptyResult != null) {
      return checkEmptyResult;
    } else if (value.length < 1 || value.length > 30) {
      return ApiConstants.requireUsernameLength;
    } else if (value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return ApiConstants.requireNotAllowedCharacter;
    } else if (value.contains(ApiConstants.regExpNotAllowedEmoji)) {
      return ApiConstants.requireNotAllowedEmoji;
    } else if (value.contains(' ')) {
      return ApiConstants.requireNotAllowedWhitespace;
    }
    return null;
  }

  static String? password(String value) {
    String? checkEmptyResult = checkEmpty(value, 'password');
    if (checkEmptyResult != null) {
      return checkEmptyResult;
    } else if (value.length < 8) {
      return ApiConstants.requirePasswordLength;
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return ApiConstants.requirePasswordUppercase;
    } else if (!value.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      return ApiConstants.requirePasswordSpecialCharacter;
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return ApiConstants.requirePasswordDigit;
    }
    return null;
  }

  static String? name(String value) {
    String? checkEmptyResult = checkEmpty(value, 'name');
    if (checkEmptyResult != null) {
      return checkEmptyResult;
    } else if (value.contains(ApiConstants.regExpNotAllowedEmoji)) {
      return ApiConstants.requireNotAllowedEmoji;
    }

    return null;
  }

  static String? email(String value) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    String? checkEmptyResult = checkEmpty(value, 'email');
    if (checkEmptyResult != null) {
      return checkEmptyResult;
    } else if (!emailRegExp.hasMatch(value)) {
      return ApiConstants.invalidEmailFormat;
    }

    return null;
  }
}
