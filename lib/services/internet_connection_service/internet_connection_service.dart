import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:my_catalog/services/network_service/interfaces/i_base_http_error.dart';
import 'package:my_catalog/services/network_service/models/base_http_response.dart';
import 'package:my_catalog/services/network_service/res/consts.dart';

/// This function will check internet connection before request.

class InternetConnectionService {
  static void startInternetCheck(void Function() errorDialog) {
    DataConnectionChecker().onStatusChange.listen((status) {
      if (status == DataConnectionStatus.disconnected) {
        errorDialog();
      }
    });
  }

  static Future<BaseHttpResponse> checkInternetConnection() async {
    final bool hasInternet = await DataConnectionChecker().hasConnection;

    if (!hasInternet) {
      return BaseHttpResponse(
        error: IBaseHttpError(
          error: NO_INTERNET_CONNECTION,
          statusCode: BAD_GATEWAY_STATUS_CODE,
        ),
      );
    }

    return null;
  }
}
