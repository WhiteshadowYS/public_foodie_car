import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/dto/get_data_request_dto/get_data_request_dto.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/res/const.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';

class GetDataRequest implements IRequest<GetDataRequestDto> {
  final String storageId;

  GetDataRequest({@required this.storageId,});

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
