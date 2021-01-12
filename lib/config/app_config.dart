import 'package:injectable/injectable.dart';

abstract class AppConfig {
  const AppConfig();

  String get name;

  String get baseUrl;

  bool get enableLogs;

  @override
  String toString() {
    return '$runtimeType {baseUrl:$baseUrl, enableLogs:$enableLogs}';
  }
}

@Environment('dev')
@Injectable(as: AppConfig)
class DevConfig extends AppConfig {
  @override
  String get baseUrl => 'http://test.foodie.org.ua/public/api';

  @override
  bool get enableLogs => true;

  @override
  String get name => 'dev';
}

@Environment('prod')
@Injectable(as: AppConfig)
class ProdConfig implements AppConfig {
  @override
  String get baseUrl => 'http://test.foodie.org.ua/public/api';

  @override
  bool get enableLogs => false;

  @override
  String get name => 'prod';
}
