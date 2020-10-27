import 'package:flutter/cupertino.dart';
import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/dictionary/flutter_dictionary.dart';
import 'package:my_catalog/models/dto/get_check_id_request_dto/get_check_id_request_dto.dart';
import 'package:my_catalog/models/models/storage_status_model.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/services/network_service/interfaces/i_base_http_error.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';

/// Adapter for main request in application. [GetCheckIdRequest].
/// This adapter will convert [GetCheckIdRequestDto] to [StorageStatusModel].
class GetCheckIdAdapter implements IAdapter<BaseHttpResponse<StorageStatusModel>> {
  final int storeId;

  @override
  final IRequest request;

  GetCheckIdAdapter({
    @required this.storeId,
    @required this.request,
  });

  @override
  Future<BaseHttpResponse<StorageStatusModel>> call() async {
    final BaseHttpResponse<GetCheckIdRequestDto> response = await request();
    if (response.response == null) {
      return BaseHttpResponse<StorageStatusModel>(
        error: IBaseHttpError(
          error: FlutterDictionary.instance.language.errorDictionary.notCatalogFound,
          statusCode: 500,
        ),
      );
    }

    final Map<String, dynamic> updatedMap = response.response.toJson();
    updatedMap.addAll({
      ApiKeys.id: storeId,
    });

    return BaseHttpResponse<StorageStatusModel>(
      response: StorageStatusModel.fromJson(updatedMap),
    );
  }
}
