import 'package:pictures_view/adapters/interfaces/i_adapter.dart';
import 'package:pictures_view/models/models/models_for_text.dart';
import 'package:pictures_view/network/shared/i_request.dart';

class TanyaAdapter implements IAdapter<Model2> {
  @override
  final IRequest request;

  TanyaAdapter({this.request});

  @override
  Future<Model2> call() async {
    Dto1 dto = await request();

    return Model2();
  }
}

