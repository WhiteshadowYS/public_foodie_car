import 'package:foodie_client_template/domain/entity/cafe/cafe.dart';

abstract class CafeService {
  Future<List<Cafe>> getCafeListForCity();
}
