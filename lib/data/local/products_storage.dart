import 'dart:convert';

import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';

@lazySingleton
class ProductsStorage {
  final FlutterSecureStorage _storage;

  const ProductsStorage(this._storage);

  static const String _productsKey = '/productsKey';

  void saveProducts(List<Product> products, Cafe cafe, Category category) {
    _storage.write(
      key: _productsKey,
      value: jsonEncode(<String, dynamic>{
        cafe.id.toString(): <String, dynamic>{
          category.id.toString(): products.map((e) => e.toJson()).toList(),
        }
      }),
    );
  }

  Future<List<Product>> getProducts(Cafe cafe, Category category) async {
    try {
      final String data = await _storage.read(key: _productsKey);

      return jsonDecode(data)[cafe.id.toString()][category.id.toString()].map<Product>((e) => Product.fromJson(e)).toList();
    } catch (e) {
      print('ProductsStorage => <getProducts> => error: $e');
      return null;
    }
  }
}
