import 'package:foodie_client_template/data/local/city_storage.dart';
import 'package:foodie_client_template/data/network/repositories/city_repository.dart';
import 'package:foodie_client_template/data/network/responses/city_response/city_response.dart';
import 'package:foodie_client_template/domain/data_services/city_service.dart';
import 'package:foodie_client_template/domain/entity/city/city.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CityService)
class CityServiceImpl implements CityService {
  final CityRepository _repository;
  final CityStorage _storage;

  CityServiceImpl(
    this._repository,
    this._storage,
  );

  @override
  Future<List<City>> getCityList() async {
    final CityResponse response = await _repository.getCityList();

    if (response.error == null && response?.cityList != null && response.cityList.isNotEmpty) {
      _storage.saveListOfCity(response.cityList);
      return response?.cityList ?? [];
    }

    final List<City> _savedList = await _storage.getCityList();

    if (_savedList != null && _savedList.isNotEmpty) {
      return _savedList;
    }

    return null;
  }

  @override
  Future<void> saveCity(City city) async => _storage.saveCity(city);

  @override
  Future<City> getSavedCity() async => await _storage.getCity();
}
