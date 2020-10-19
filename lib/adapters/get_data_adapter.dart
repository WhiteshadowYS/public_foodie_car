import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/get_data_request_dto.dart';
import 'package:my_catalog/models/models/storage_model/storage_model.dart';
import 'package:my_catalog/network/requests/get_data_request.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

/// Adapter for main request in application. [GetDataRequest].
/// This adapter will convert [GetDataRequestDto] to [StorageModel].
class GetDataAdapter implements IAdapter<BaseHttpResponse<StorageModel>> {
  @override
  final IRequest request;

  GetDataAdapter({this.request});

  @override
  Future<BaseHttpResponse<StorageModel>> call() async {
    final BaseHttpResponse<GetDataRequestDto> response = await request();

    final StorageModel model = StorageModel.fromJson(
      response.response.toJson(),
    );

    return BaseHttpResponse<StorageModel>(
      response: model,
    );
  }
}
