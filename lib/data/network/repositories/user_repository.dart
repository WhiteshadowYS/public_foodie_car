import 'package:foody_client_template/data/local/user_storage.dart';
import 'package:foody_client_template/data/network/repositories/base_repository.dart';
import 'package:foody_client_template/domain/data_services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@lazySingleton
class UserRepository extends BaseRepository {
  final UserStorage _userStorage;
  final UserService _userService;

  UserRepository(
    final Dio _dio,
    this._userService,
    this._userStorage,
  ) : super(_dio);

  Logger get _logger => Logger('$runtimeType #${identityHashCode(this)} ');

  Future<List<String>> getItems() async {
    _logger.warning('message');
    await dio.delete('path');
    await _userService.getProfiel();
    await _userStorage.getItems();
    return <String>['???'];
  }
}
