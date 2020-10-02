
import 'package:flutter/material.dart';
import 'package:my_catalog/services/network_service/network_service.dart';

/// Interface created for httpErrors. Does using from [NetworkService]
class IBaseHttpError {
  final int statusCode;
  final String error;

  IBaseHttpError({
    @required this.error,
    @required this.statusCode,
  });
}
