import 'package:foodie_client_template/domain/data_services/brands_service.dart';
import 'package:foodie_client_template/domain/data_services/products_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsService)
class ProductsServiceImpl implements ProductsService {}
