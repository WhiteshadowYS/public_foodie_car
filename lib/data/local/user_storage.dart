import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserStorage {
  final FlutterSecureStorage _storage;

  UserStorage(this._storage);

  Future<List<String>> getItems() async {
    return <String>['???'];
  }
}
