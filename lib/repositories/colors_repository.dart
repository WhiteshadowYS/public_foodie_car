import 'package:my_catalog/adapters/colors_scheme_adapter.dart';
import 'package:my_catalog/models/models/color_scheme_model.dart';
import 'package:my_catalog/network/requests/get_default_color_scheme.dart';
import 'package:my_catalog/repositories/shared/repository.dart';

class ColorsRepository extends Repository {
  Future<ColorSchemeModel> getDefaultColorScheme() async {
    return await repository<ColorSchemeModel>(
      ColorSchemeAdapter(request: GetDefaultColorScheme()),
    );
  }
}
