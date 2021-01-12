import 'package:foodie_client_template/data/network/repositories/brands_repository.dart';
import 'package:foodie_client_template/data/network/responses/brands_response/brands_response.dart';
import 'package:foodie_client_template/domain/data_services/brands_service.dart';
import 'package:foodie_client_template/domain/entity/brand/brand.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BrandsService)
class BrandsServiceImpl implements BrandsService {
  final BrandsRepository _brandsRepository;

  BrandsServiceImpl(
    this._brandsRepository,
  );

  @override
  Future<List<Brand>> getBrands() async {
    final BrandsResponse response = await _brandsRepository.getBrands();

    if (response.error == null) {
      return response.brands;
    }
    return null;
  }
}
