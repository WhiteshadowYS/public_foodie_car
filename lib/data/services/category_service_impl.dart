import 'package:foodie_client_template/data/local/categories_storage.dart';
import 'package:foodie_client_template/data/network/repositories/categories_repository.dart';
import 'package:foodie_client_template/domain/data_services/categories_service.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoriesService)
class CategoriesServiceImpl implements CategoriesService {
  final CategoriesRepository _repository;
  final CategoriesStorage _storage;

  CategoriesServiceImpl(
    this._repository,
    this._storage,
  );

  @override
  Future<List<Category>> getCategoriesForCafe(Cafe cafe) async {
    final response = await _repository.getCategoriesForCafe(cafe);

    if (response.error == null && response?.categories != null && response.categories.isNotEmpty) {
      _storage.saveCategories(response.categories, cafe);
      return response?.categories ?? [];
    }

    final List<Category> _savedList = await _storage.getCategoriesForCafe(cafe);

    if (_savedList != null && _savedList.isNotEmpty) {
      return _savedList;
    }

    return null;
  }
}
