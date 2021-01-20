import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';
import 'package:foodie_client_template/domain/entity/category/category.dart';

abstract class CategoriesService {
  Future<List<Category>> getCategoriesForCafe(Cafe cafe);
}
