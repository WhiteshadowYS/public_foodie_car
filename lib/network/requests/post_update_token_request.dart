import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/post_update_token_request_dto/post_update_token_request_dto.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';
import 'package:my_catalog/ui/pages/main_page/main_page.dart';

/// This request we use after every language change in application and after accepting terms.
/// Returned value: [***]. No Data.
/// link for documentation: https://appvesto.atlassian.net/wiki/spaces/MAN/pages/78708864/API.?atlOrigin=eyJpIjoiMTczOTVkN2M2YjIyNGFjOGFiYWM5NDhjZWQ5YTU4ZDMiLCJwIjoiYyJ9
/// functions name:
///   - "type" - post
///   - "function" - [updateToken] - [String].
///   - "url" - [Api.mockApiLink] - [String]
///   *In last update we use mock api. In the future we need to change it to server.
/// params of function:
///   - "id" - [storageId]. This string param what we will input on [MainPage]. It contains in [StorageIdTextFieldState].
///   *In last update name of param - [StorageIdTextFieldState.storageId].
///   - "api_version". This string param it is const variable in [Api] class.
///   *In last update name of param - [Api.version].
///   - "push_token" - [pushToken]. No Realisation at this moment (This token we will take from [NotificationService] in the future).
///   - "device_id" - [deviceId]. No Realisation at this moment (This id we will take from [DeviceService] in the future).
///   - "language" - [language]. No Realisation at this moment (This param we will take from [Data] in the future).
class PostUpdateTokenRequest implements IRequest<Null> {
  final int id;
  final String pushToken;
  final String deviceId;
  final String language;

  PostUpdateTokenRequest({
    @required this.id,
    @required this.pushToken,
    @required this.deviceId,
    @required this.language,
  });

  @override
  Future<Null> call() async {
    final BaseHttpResponse response = await NetworkService.instance.request(
      RequestBuilders.post(
        url: Api.mockApiLink,
        functionName: ApiFunctions.updateToken,
        body: {
          ApiKeys.id: id.toString(),
          ApiKeys.pushToken: pushToken,
          ApiKeys.deviceId: deviceId,
          ApiKeys.language: language,
          ApiKeys.apiVersion: Api.version,
        },
      ),
    );

    return PostUpdateTokenRequestDto.fromJson(response.response);
  }
}
