import 'package:my_catalog/models/dtos/get_color_scheme_response_dto.dart';
import 'package:my_catalog/network/shared/i_request.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/network_service.dart';
import 'package:my_catalog/services/network_service/shared/request_builders.dart';

class GetDefaultColorScheme implements IRequest<GetColorSchemeResponseDto> {
  @override
  Future<GetColorSchemeResponseDto> call() async {
    final BaseHttpResponse respose = await NetworkService.instance.request(
      RequestBuilders.get(
        url: 'http://colormind.io/api/',
        functionName: '',
        params: {
          '123': '123',
        },
      ),
    );

    final Map<String, dynamic> map = {};

    return GetColorSchemeResponseDto.fromMap(map);
  }
}
