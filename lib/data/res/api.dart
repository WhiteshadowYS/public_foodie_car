///[Api] class contains general constants for requests
///[verion] - api version
///[apiLink] - api link
///[mockApiLink] - mockup link
class Api {
  static const String version = '1';
  static const String apiLink = 'http://test.foodie.org.ua/public/api/';
  static const String mockApiLink = 'http://test.foodie.org.ua/public/api/';
}

///[ApiFunctions] class contains constants with api function names
/// [/api/brands] - список всех названий ресторанов
/// [/api/brands/{id}] - название ресторана по айди
/// [/api/locations]- локации
/// [/api/locations/{id}] - локация по ее айди
class ApiFunctions {
  static const String getRestourantsList = 'brands';
  static const String getRestouranName = 'brands/';
  static const String getLocations = 'locations';
  static const String getLocationById = 'locations/';
}

///[ApiKeys] class contains constants with api keys
class ApiKeys {}
