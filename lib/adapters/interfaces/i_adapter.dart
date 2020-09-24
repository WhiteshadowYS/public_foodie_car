import 'package:pictures_view/network/shared/i_request.dart';

abstract class IAdapter<T> {
  final IRequest request;

  IAdapter({this.request});

  Future<T> call();
}