import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CityStorage {
  final FlutterSecureStorage _storage;

  const CityStorage(this._storage);

  static const String _cityKey = '/cityKey';
  static const String _cityListKey = '/cityListKey';

  void saveListOfCity(List<City> city) async {
    await _storage.write(key: _cityListKey, value: jsonEncode(city.map((e) => e.toJson()).toList()));
  }

  void saveCity(City city) async {
    await _storage.write(key: _cityKey, value: jsonEncode(city.toJson()));
  }

  Future<List<City>> getCityList() async {
    try {
      final String data = await _storage.read(key: _cityListKey);

      return jsonDecode(data).map<City>((i) => City.fromJson(i)).toList();
    } catch (e) {
      print('CityStorage => <getSupportedCity> => error: $e');
      return null;
    }
  }

  Future<City> getCity() async {
    try {
      final String data = await _storage.read(key: _cityKey);

      return City.fromJson(jsonDecode(data));
    } catch (e) {
      print('CityStorage => <getSupportedCity> => error: $e');
      return null;
    }
  }
}
