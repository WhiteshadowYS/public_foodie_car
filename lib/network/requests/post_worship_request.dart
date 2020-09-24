import 'package:pictures_view/models/models/models_for_text.dart';
import 'package:pictures_view/network/shared/i_request.dart';

class PostWorshipToAlexRequest implements IRequest<Dto1> {
  @override
  Future<Dto1> call({String token, Map<String, dynamic> params}) async {
    return Dto1();
  }
}
