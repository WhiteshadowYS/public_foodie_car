import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodie_car_template/dictionary/models/supported_language.dart';
import 'package:foodie_car_template/domain/entity/order/order.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class OrdersStorage {
  final FlutterSecureStorage _storage;

  const OrdersStorage(this._storage);

  static const String _supportedLanguageKey = '/supportedLanguage';

  void saveOrders(List<Order> orders) {
    // _storage.write(key: _supportedLanguageKey, value: jsonEncode(language.toJson()));
  }

  Future<List<Order>> getOrders() async {
    try {
      final String data = await _storage.read(key: _supportedLanguageKey);

      return [];
    } catch (e) {
      print('LanguageStorage => <getSupportedLanguage> => error: $e');
      return null;
    }
  }
}
