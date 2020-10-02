import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/dto/get_check_id_request_dto/get_check_id_request_dto.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/shared/i_request.dart';

/// Adapter for main request in application. [GetCheckIdRequest].
/// This adapter will convert [GetCheckIdRequestDto] to [StorageStatusModel].
class GetCheckIdAdapter implements IAdapter<StorageStatusModel> {
  @override
  final IRequest request;

  GetCheckIdAdapter({this.request});

  @override
  Future<StorageStatusModel> call() async {
    final GetCheckIdRequestDto dto = await request();

    return StorageStatusModel.fromJson(dto.toJson());
  }
}
