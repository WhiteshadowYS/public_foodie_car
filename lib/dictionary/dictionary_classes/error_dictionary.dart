import 'package:flutter/material.dart';

class ErrorDictionary {
  final String isNumberError;
  final String isNegativeNumIdError;
  final String isZeroNumIdError;

  const ErrorDictionary({
    @required this.isNumberError,
    @required this.isNegativeNumIdError,
    @required this.isZeroNumIdError,
  });
}