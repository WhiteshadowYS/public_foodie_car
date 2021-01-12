import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:injectable/injectable.dart';
import 'package:foodie_client_template/data/network/repositories/base_repository.dart';

@lazySingleton
class ProductsRepository extends BaseRepository {
  ProductsRepository(
    final Dio _dio,
  ) : super(_dio);

  Logger get _logger => Logger('$runtimeType #${identityHashCode(this)} ');

  Future<Null> getBrands() async {
    return null;
  }
}
