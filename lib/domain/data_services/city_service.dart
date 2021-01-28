import 'package:foodie_car_template/domain/entity/city/city.dart';

abstract class CityService {
  Future<List<City>> getCityList();
  Future<void> saveCity(City city);
  Future<City> getSavedCity();
}
