import 'package:foodie_client_template/domain/data_services/user_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserService)
class UserServiceImpl implements UserService {
  @override
  Future<List<String>> getItems() {}

  @override
  Future<List<String>> getProfiel() {
    print('test');
  }
}
