import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/models/storage_model.dart';
import 'package:my_catalog/network/shared/i_request.dart';

class GetDataAdapter implements IAdapter<StorageModel> {
  @override
  final IRequest request;

  GetDataAdapter({this.request});

  @override
  Future<StorageModel> call() async {
    // final GetColorSchemeResponseDto dto = await request();

    final StorageModel model = StorageModel.fromMap({});

    return model;
  }
}
