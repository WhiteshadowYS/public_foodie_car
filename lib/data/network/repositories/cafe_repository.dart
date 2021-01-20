import 'dart:convert';

import 'package:foodie_client_template/config/app_config.dart';
import 'package:foodie_client_template/data/network/responses/cafe_response/cafe_response.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@lazySingleton
class CafeRepository {
  Future<CafeResponse> getCafeForCity() async {
    try {
      final http.Response response = await http.get('${DevConfig().baseUrl}/restaurants');

      if (response.statusCode == 200) {
        return CafeResponse.fromJson(jsonDecode(response.body));
      }

      return CafeResponse(
        error: response.statusCode.toString(),
      );
    } catch (e) {
      print('CafeRepository => <getCafeForCity> => $e');
      return CafeResponse(
        error: e.toString(),
      );
    }
  }
}

// final Map<String, dynamic> json = {
//       'data': [
//         {
//           'id': 0,
//           'name': 'Chin Chin',
//           'description':
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//           'imageUrl': 'https://www.chinchinrestaurant.com.au/sydney/wp-content/uploads/sites/4/2019/07/gogo-05-572x413.jpg',
//         },
//         {
//           'id': 1,
//           'name': 'KFC',
//           'description':
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//           'imageUrl': 'https://upload.wikimedia.org/wikipedia/ru/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png',
//         },
//         {
//           'id': 2,
//           'name': 'McDonalds',
//           'description':
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//           'imageUrl':
//               'https://thumbs.dreamstime.com/b/macdonald-%D0%B7%D0%BD%D0%B0%D0%BA-s-%D0%BF%D1%80%D0%B8%D0%B2%D0%BE%D0%B4-mcdonalds-%D1%87%D0%B5%D1%80%D0%B5%D0%B7-%D0%B2%D0%B5%D1%87%D0%B5%D1%80%D0%BE%D0%BC-142256549.jpg',
//         },
//       ],
//     };
