import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';

@lazySingleton
class CafeStorage {
  final FlutterSecureStorage _storage;

  const CafeStorage(this._storage);

  static const String _cafeListKey = '/cafeList';

  void saveCafeList(List<Cafe> cafeList) {
    _storage.write(
      key: _cafeListKey,
      value: jsonEncode(
        cafeList.map((e) => e.toJson()).toList(),
      ),
    );
  }

  Future<List<Cafe>> getCafeList() async {
    try {
      final String data = await _storage.read(key: _cafeListKey);

      return jsonDecode(data).map<Cafe>((e) => Cafe.fromJson(e)).toList();
    } catch (e) {
      print('LanguageStorage => <getSupportedLanguage> => error: $e');
      return null;
    }
  }
}
