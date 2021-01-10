import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

const nullStringValue = "null";

abstract class BaseRepository {
  BaseRepository(this.dio);

  final Dio dio;

  Logger get logger => Logger('$runtimeType #${identityHashCode(this)} ');

  Future<dynamic> getHttp(
    String url, {
    Map<String, dynamic> data = const <String, dynamic>{},
    Map<String, dynamic> queryParams,
    bool bypass = false,
  }) async {
    logger.info('getHttp -> url: $url');
    final response = await dio.get<dynamic>(
      url,
      queryParameters: queryParams,
      options: Options(
        headers: <String, dynamic>{
          ...data,
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('getHttp: url: $url ${response.statusCode}');
  }

  Future<dynamic> postHttp({
    String url,
    Map data,
    bool bypass = false,
  }) async {
    logger.info('postHttp -> url: $url');
    final response = await dio.post<dynamic>(
      url,
      data: data,
      options: Options(
        headers: <String, dynamic>{},
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('postHttp: url: $url ${response.statusCode}');
  }

  Future<dynamic> postFile(String url, File file) async {
    final String fileName = file.path.split('/').last;
    final Map<String, MultipartFile> data = {'image': await MultipartFile.fromFile(file.path, filename: fileName)};

    logger.info('postHttpFile -> url: $url');
    final response = await dio.post<dynamic>(
      url,
      data: FormData.fromMap(data),
      options: Options(
        headers: <String, dynamic>{},
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('postHttpFile: url: $url ${response.statusCode}');
  }

  Future<dynamic> putHttp({
    String url,
    Map data,
    bool bypass = false,
  }) async {
    logger.info('putHttp -> url: $url');
    final response = await dio.put<dynamic>(
      url,
      data: data,
      options: Options(
        headers: <String, dynamic>{},
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('putHttp: url: $url ${response.statusCode}');
  }

  Future<dynamic> deleteHttp({
    String url,
    Map data,
  }) async {
    logger.info('putHttp -> url: $url');
    final response = await dio.delete<dynamic>(
      url,
      data: data,
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('deleteHttp: url: $url ${response.statusCode}');
  }
}
