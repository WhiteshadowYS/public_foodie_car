import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';
import 'package:foodie_client_template/domain/entity/product/product.dart';

abstract class ProductsService {
  Future<List<Product>> getProductsForCategory(Cafe cafe, Category category);
}
