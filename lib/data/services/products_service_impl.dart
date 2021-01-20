import 'package:foodie_client_template/data/local/products_storage.dart';
import 'package:foodie_client_template/data/network/repositories/products_repository.dart';
import 'package:foodie_client_template/data/network/responses/products_response/products_response.dart';
import 'package:foodie_client_template/domain/data_services/products_service.dart';
import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsService)
class ProductsServiceImpl implements ProductsService {
  final ProductsRepository _repository;
  final ProductsStorage _storage;

  ProductsServiceImpl(
    this._repository,
    this._storage,
  );
  @override
  Future<List<Product>> getProductsForCategory(Cafe cafe, Category category) async {
    final ProductsResponse response = await _repository.getProductsForCategory(cafe, category);

    if (response.error == null && response?.products != null && response.products.isNotEmpty) {
      _storage.saveProducts(response.products, cafe, category);
      return response?.products ?? [];
    }

    final List<Product> _savedList = await _storage.getProducts(cafe, category);

    if (_savedList != null && _savedList.isNotEmpty) {
      return _savedList;
    }

    return null;
  }
}
