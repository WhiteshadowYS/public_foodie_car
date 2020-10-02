import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/get_data_request_dto.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/network/shared/i_request.dart';

/// Adapter for main request in application. [GetDataRequest].
/// This adapter will convert [GetDataRequestDto] to [StorageModel].
class GetDataAdapter implements IAdapter<StorageModel> {
  @override
  final IRequest request;

  GetDataAdapter({this.request});

  @override
  Future<StorageModel> call() async {
    final GetDataRequestDto dto = await request();

    final StorageModel model = StorageModel.fromJson(dto.toJson());

    return model;
  }
}
