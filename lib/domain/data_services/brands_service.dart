import 'package:foodie_client_template/domain/entity/brand/brand.dart';

abstract class BrandsService {
  Future<List<Brand>> getBrands();
}
