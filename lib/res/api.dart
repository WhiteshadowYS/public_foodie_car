///[Api] class contains general constants for requests
///[verion] - api version
///[apiLink] - api link
///[mockApiLink] - mockup link
class Api {
  static const String version = '1';
  static const String apiLink = '';
  static const String mockApiLink = 'https://us-central1-mycatalog-appvesto.cloudfunctions.net';
}

///[ApiFunctions] class contains constants with api function names
class ApiFunctions {
  static const String getData = '/getData';
  static const String checkId = '/checkId';
  static const String updateToken = '/updateToken';
}

///[ApiKeys] class contains constants with api keys
class ApiKeys {
  static const String id = 'id';
  static const String apiVersion = 'api_version';
  static const String pushToken = 'push_token';
  static const String deviceId = 'device_id';
  static const String language = 'language';
}