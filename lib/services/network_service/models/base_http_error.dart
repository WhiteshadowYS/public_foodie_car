import 'package:flutter/foundation.dart';

class BaseHttpError {
  final int statusCode;
  final String error;

  BaseHttpError({
    @required this.error,
    @required this.statusCode,
  });
}