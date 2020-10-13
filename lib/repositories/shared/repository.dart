import 'package:my_catalog/adapters/interfaces/i_adapter.dart';

class Repository {
  Future<T> repository<T>(IAdapter adapter) async {
    return await adapter();
  }