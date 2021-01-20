import 'dart:convert';

import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';

@lazySingleton
class CategoriesStorage {
  final FlutterSecureStorage _storage;

  const CategoriesStorage(this._storage);

  static const String _categoriesKey = '/categoriesKey';

  void saveCategories(List<Category> categories, Cafe cafe) {
    _storage.write(
      key: _categoriesKey,
      value: jsonEncode(<String, dynamic>{
        cafe.id.toString(): categories.map((e) => e.toJson()).toList(),
      }),
    );
  }

  Future<List<Category>> getCategoriesForCafe(Cafe cafe) async {
    try {
      final String data = await _storage.read(key: _categoriesKey);

      return jsonDecode(data)[cafe.id.toString()].map<Category>((e) => Category.fromJson(e)).toList();
    } catch (e) {
      print('LanguageStorage => <getSupportedLanguage> => error: $e');
      return null;
    }
  }
}
