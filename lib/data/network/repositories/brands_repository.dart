import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie_client_template/config/app_config.dart';
import 'package:foodie_client_template/data/network/responses/brands_response/brands_response.dart';
import 'package:logging/logging.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@lazySingleton
class BrandsRepository {
  Future<BrandsResponse> getBrands() async {
    try {
      final http.Response response = await http.get('${DevConfig().baseUrl}/brands');

      if (response.statusCode == 200) {
        return BrandsResponse.fromJson(jsonDecode(response.body));
      }

      return BrandsResponse(
        error: response.statusCode.toString(),
      );
    } catch (e) {
      print('BrandsRepository => <getBrands> => $e');
      return BrandsResponse(
        error: e.toString(),
      );
    }
  }
}
