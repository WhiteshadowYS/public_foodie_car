import 'package:pictures_view/adapters/tanya_adapter.dart';
import 'package:pictures_view/models/models/models_for_text.dart';
import 'package:pictures_view/network/requests/get_tanya_request.dart';
import 'package:pictures_view/network/requests/post_worship_request.dart';
import 'package:pictures_view/repositories/shared/repository.dart';

class TanyaRepository extends Repository {
  Future<Model1> postWorship() async {
    return await repository(
      TanyaAdapter(request: PostWorshipToAlexRequest()),
    );
  }

  Future<Model1> getTanya() async {
    return await repository<Model1>(
      TanyaAdapter(request: GetTanyaRequest()),
    );
  }
}
