import 'package:foodie_client_template/data/local/cafe_storage.dart';
import 'package:foodie_client_template/data/network/repositories/cafe_repository.dart';
import 'package:foodie_client_template/data/network/responses/cafe_response/cafe_response.dart';
import 'package:foodie_client_template/domain/data_services/cafe_service.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CafeService)
class CafeServiceImpl implements CafeService {
  final CafeRepository _repository;
  final CafeStorage _storage;

  CafeServiceImpl(
    this._repository,
    this._storage,
  );

  @override
  Future<List<Cafe>> getCafeListForCity() async {
    final CafeResponse response = await _repository.getCafeForCity();

    if (response.error == null && response?.cafeList != null && response.cafeList.isNotEmpty) {
      _storage.saveCafeList(response.cafeList);
      return response?.cafeList ?? [];
    }

    final List<Cafe> _savedList = await _storage.getCafeList();

    if (_savedList != null && _savedList.isNotEmpty) {
      return _savedList;
    }

    return null;
  }
}
