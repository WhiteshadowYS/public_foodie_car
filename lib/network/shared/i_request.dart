abstract class IRequest<T> {
  Future<T> call({
    String token,
    Map<String, dynamic> params,
  });
}