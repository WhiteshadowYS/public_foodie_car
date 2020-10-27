import 'package:flutter/material.dart';

class ErrorDictionary {
  final String isNumberError;
  final String notCatalogFound;
  final String isNegativeNumIdError;
  final String isZeroNumIdError;
  final String errorNotFound;

  const ErrorDictionary({
    @required this.notCatalogFound,
    @required this.isNumberError,
    @required this.isNegativeNumIdError,
    @required this.isZeroNumIdError,
    @required this.errorNotFound,
  });
}