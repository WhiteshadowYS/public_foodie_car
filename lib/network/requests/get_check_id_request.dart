import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_check_id_request_dto/get_check_id_request_dto.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';

/// This request we use after every route in application. Request will check a last update of storage data.
/// Returned value: [***]. It is [DTO] with [UNIX] data of last update.
/// link for documentation: https://appvesto.atlassian.net/wiki/spaces/MAN/pages/78708864/API.?atlOrigin=eyJpIjoiMTczOTVkN2M2YjIyNGFjOGFiYWM5NDhjZWQ5YTU4ZDMiLCJwIjoiYyJ9
/// function:
///   - "type" - [get].
///   - "name" - [checkId].
///   - "url" - [Api.mockApiLink]
///   *In last update we use mock api. In the future we need to change it to server.
/// params of function:
///   - "id" - [storageId]. This string param what we will input on [MainPage]. It contains in [StorageIdTextFieldState].
///   *In last update name of param - [StorageIdTextFieldState.storageId].
///   - "api_version". This string param it is const variable in [Api] class.
///   *In last update name of param - [Api.version].
class GetCheckIdRequest implements IRequest<BaseHttpResponse<GetCheckIdRequestDto>> {
  final String storageId;

  GetCheckIdRequest({
    @required this.storageId,
  });

  @override
  Future<BaseHttpResponse<GetCheckIdRequestDto>> call() async {
    final BaseHttpResponse response = await NetworkService.instance.request(
      RequestBuilders.get(
        url: Api.mockApiLink,
        functionName: ApiFunctions.checkId,
        params: {
          ApiKeys.id: storageId,
          ApiKeys.apiVersion: Api.version,
        },
      ),
    );

    return BaseHttpResponse<GetCheckIdRequestDto>(response: GetCheckIdRequestDto.fromJson(response.response['data']));
  }
}
