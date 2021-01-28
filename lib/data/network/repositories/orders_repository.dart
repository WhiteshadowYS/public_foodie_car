import 'dart:convert';

import 'package:foodie_car_template/config/app_config.dart';
import 'package:foodie_car_template/data/network/responses/city_response/city_response.dart';
import 'package:foodie_car_template/data/network/responses/orders_response.dart/orders_response.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@lazySingleton
class OrdersRepository {
  Future<OrdersResponse> getOrders() async {
    try {
      // final http.Response response = await http.get('${DevConfig().baseUrl}/cities');

      // if (response.statusCode == 200) {
      //   return CityResponse.fromJson(jsonDecode(response.body));
      // }

      // return CityResponse(
      //   error: response.statusCode.toString(),
      // );
    } catch (e) {
      print('BrandsRepository => <getBrands> => $e');
      return OrdersResponse(
        error: e.toString(),
      );
    }
  }
}
