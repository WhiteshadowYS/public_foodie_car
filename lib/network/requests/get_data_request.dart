import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/get_data_request_dto.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';
import 'package:my_catalog/store/pages/home_page/storage_id_text_field_state/storage_id_text_field_state.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';

/// Main Http Request of application. Need for get all data about storage from server.
/// Returned value: [GetDataRequestDto]. It is [DTO] with all data.
/// link for documentation: https://appvesto.atlassian.net/wiki/spaces/MAN/pages/78708864/API.?atlOrigin=eyJpIjoiMTczOTVkN2M2YjIyNGFjOGFiYWM5NDhjZWQ5YTU4ZDMiLCJwIjoiYyJ9
/// function:
///   - "type" - [get].
///   - "name" - [getData].
///   - "url" - [Api.mockApiLink]
///   *In last update we use mock api. In the future we need to change it to server.
/// params of function:
///   - "id" - [storageId]. This string param what we will input on [MainPage]. It contains in [StorageIdTextFieldState].
///   *In last update name of param - [StorageIdTextFieldState.storageId].
///   - "api_version". This string param it is const variable in [Api] class.
///   *In last update name of param - [Api.version].
class GetDataRequest implements IRequest<GetDataRequestDto> {
  final String storageId;

  GetDataRequest({
    @required this.storageId,
  });

  @override
  Future<GetDataRequestDto> call() async {
    final BaseHttpResponse response = await NetworkService.instance.request(
      RequestBuilders.get(
        url: Api.mockApiLink,
        functionName: ApiFunctions.getData,
        params: {
          ApiKeys.id: storageId,
          ApiKeys.apiVersion: Api.version,
        },
      ),
    );

    return GetDataRequestDto.fromJson(response.response[ResponseKeys.data]);
  }
}
