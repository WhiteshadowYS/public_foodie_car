import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';

/// [ValidationService] it is service for validation of input text.
/// Methods:
/// - [numberValidation] function for numbers validation, it checks input values and return error if it is not number,
///   if it starts at zero, or if number is negative or null.

class ValidationService {
  static String numberValidation(String arg, ErrorDictionary dictionary) {
    final RegExp regExp = RegExp(r'^-?[0-9]+$');

    if (arg == null || arg == '') return null;

    if (arg.startsWith('0')) {
      return dictionary.isZeroNumIdError;
    }

    if (!regExp.hasMatch(arg)) {
      return dictionary.isNumberError;
    }

    if (int.tryParse(arg) == null) {
      return dictionary.isNumberError;
    }

    if (int.tryParse(arg) <= 0) {
      return dictionary.isNegativeNumIdError;
    }

    return null;
  }
}