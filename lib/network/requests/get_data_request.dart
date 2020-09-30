import 'package:flutter/cupertino.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/res/api.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';

class GetDataRequest implements IRequest<Null> {
  final String storageId;

  GetDataRequest({@required this.storageId,});

  @override
  Future<Null> call() async {
    final BaseHttpResponse respose = await NetworkService.instance.request(
      RequestBuilders.get(
        url: Api.mockApiLink,
        functionName: ApiFunctions.getData,
        params: {
          ApiKeys.id: storageId,
          ApiKeys.apiVersion: Api.version,
        },
      ),
    );

    final Map<String, dynamic> map = {};

    return ;
  }
}
