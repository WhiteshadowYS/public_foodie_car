import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:foodie_client_template/config/app_config.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/data/network/responses/categories_response/categories_response.dart';

@lazySingleton
class CategoriesRepository {
  Future<CategoriesResponse> getCategoriesForCafe(Cafe cafe) async {
    try {
      final http.Response response = await http.get('${DevConfig().baseUrl}/restaurants/${cafe?.id}/categories');

      if (response.statusCode == 200) {
        return CategoriesResponse.fromJson(jsonDecode(response.body));
      }

      return CategoriesResponse(
        error: response.statusCode.toString(),
      );
    } catch (e) {
      print('CategoriesRepository => <CategoriesRepository> => $e');
      return CategoriesResponse(
        error: e.toString(),
      );
    }
  }
}

// final Map<String, dynamic> json = {
//   'data': [
//     {
//       'id': 0,
//       'title': 'Пицца',
//       'imageUrl': 'https://image.flaticon.com/icons/png/512/99/99954.png',
//     },
//     {
//       'id': 1,
//       'title': 'Бургеры (Пицца)',
//       'imageUrl': 'https://hungryboyfriend.ru/wp-content/uploads/2016/06/burgeri_gotovi.jpg',
//     },
//     {
//       'id': 2,
//       'title': 'Напитки (Пицца)',
//       'imageUrl': 'https://ekd.me/wp-content/uploads/2018/01/c6715a990f4d48dd958f6d56f452d68b.jpg',
//     },
//     {
//       'id': 3,
//       'title': 'Супы (Пицца)',
//       'imageUrl': 'https://grandkulinar.ru/uploads/posts/2019-06/1561364899_50-receptov-supov.jpg',
//     },
//   ],
// };
