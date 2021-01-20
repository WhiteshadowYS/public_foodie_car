import 'dart:convert';

import 'package:foodie_client_template/config/app_config.dart';
import 'package:foodie_client_template/data/network/responses/city_response/city_response.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@lazySingleton
class CityRepository {
  Future<CityResponse> getCityList() async {
    try {
      final http.Response response = await http.get('${DevConfig().baseUrl}/cities');

      if (response.statusCode == 200) {
        return CityResponse.fromJson(jsonDecode(response.body));
      }

      return CityResponse(
        error: response.statusCode.toString(),
      );
    } catch (e) {
      print('BrandsRepository => <getBrands> => $e');
      return CityResponse(
        error: e.toString(),
      );
    }
  }
}
