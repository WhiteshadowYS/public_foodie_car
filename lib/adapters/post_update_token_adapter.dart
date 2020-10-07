import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/dto/post_update_token_request_dto/post_update_token_request_dto.dart';
import 'package:my_catalog/models/models/update_token_status_model.dart';
import 'package:my_catalog/network/requests/post_update_token_request.dart';
import 'package:my_catalog/network/shared/i_request.dart';

/// Adapter for main request in application. [PostUpdateTokenRequest].
/// This adapter will convert [PostUpdateTokenRequestDto] to [UpdateTokenStatusModel].
class PostUpdateTokenAdapter implements IAdapter<UpdateTokenStatusModel> {
  @override
  final IRequest request;

  PostUpdateTokenAdapter({this.request});

  @override
  Future<UpdateTokenStatusModel> call() async {
    final PostUpdateTokenRequestDto dto = await request();

    return UpdateTokenStatusModel.fromJson(dto.toJson());
  }
}