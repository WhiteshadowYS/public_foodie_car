import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:foodie_client_template/config/app_config.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/data/network/responses/products_response/products_response.dart';

@lazySingleton
class ProductsRepository {
  Future<ProductsResponse> getProductsForCategory(Cafe cafe, Category category) async {
    try {
      final http.Response response = await http.get('${DevConfig().baseUrl}/restaurants/${cafe?.id}/categories/${category?.id}/products');

      if (response.statusCode == 200) {
        return ProductsResponse.fromJson(jsonDecode(response.body));
      }

      return ProductsResponse(
        error: response.statusCode.toString(),
      );
    } catch (e) {
      print('ProductsRepository => <getProductsForCategory> => $e');
      return ProductsResponse(
        error: e.toString(),
      );
    }
  }
}

// final Map<String, dynamic> json = {
//   'data': [
//     {
//       'id': 0,
//       'title': 'Классическая Пепперони',
//       'description': 'Соус "Томатный", сыр Моцарелла, салями, орегано. Диаметр пиццы - 30 см, корж - средний.',
//       'category': 'Пицца',
//       'price': 145,
//       'weight': 300,
//       'imageUrl':
//           'http://fontan.od.ua/image/cache/data/deserti/%D0%9F%D0%B5%D0%BF%D0%B5%D1%80%D0%BE%D0%BD%D0%B8%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F-400x400.jpg',
//     },
//     {
//       'id': 1,
//       'title': 'Ржаная пицца с манго и индейкой',
//       'description': 'Томатный соус, индейка, манго, грибы, сыр моцарелла, орегано. Диаметр пиццы - 30 см, корж - средний.',
//       'category': 'Пицца',
//       'price': 180,
//       'weight': 300,
//       'imageUrl':
//           'http://fontan.od.ua/image/cache/data/2019/%D0%BF%D0%B8%D1%86%D1%86%D0%B2%20%D1%81%20%D0%BC%D0%B0%D0%BD%D0%B3%D0%BE%20%D0%B8%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%B9%D0%BA%D0%BE%D0%B9-400x400.JPG',
//     },
//     {
//       'id': 2,
//       'title': 'Пицца "С охотничьми колбасками"',
//       'description': 'Томатный соус, сыр "Моцарелла", лук, помидор, орегано. Диаметр пиццы - 30 см, корж - средний.',
//       'category': 'Пицца',
//       'price': 75,
//       'weight': 300,
//       'imageUrl': 'http://fontan.od.ua/image/cache/data/222-400x400.jpg',
//     },
//   ],
// };
