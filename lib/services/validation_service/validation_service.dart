import 'package:my_catalog/dictionary/dictionary_classes/error_dictionary.dart';

// TODO(Yuri): Add comment for this service.
class ValidationService {
  static String numberValidation(String arg, ErrorDictionary dictionary) {
    final RegExp regExp = RegExp(r'^-?[0-9]+$');

    if (arg == null || arg == '') return null;

    if (arg.startsWith('0')) {
      return dictionary.isNumberError;
    }

    if (!regExp.hasMatch(arg)) {
      return dictionary.isNumberError;
    }

    if (int.tryParse(arg) == null) {
      return dictionary.isNumberError;
    }

    return null;
  }
}