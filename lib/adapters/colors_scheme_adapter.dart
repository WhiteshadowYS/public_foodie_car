import 'package:flutter/material.dart';
import 'package:my_catalog/adapters/interfaces/i_adapter.dart';
import 'package:my_catalog/models/dtos/get_color_scheme_response_dto.dart';
import 'package:my_catalog/models/models/color_scheme_model.dart';
import 'package:my_catalog/network/shared/i_request.dart';

class ColorSchemeAdapter implements IAdapter<ColorSchemeModel> {
  @override
  final IRequest request;

  ColorSchemeAdapter({this.request});

  @override
  Future<ColorSchemeModel> call() async {
    final GetColorSchemeResponseDto dto = await request();

    try {
      final ColorSchemeModel model = ColorSchemeModel(
        colors: dto.result.map<Color>((List<int> color) {
          return Color.fromRGBO(color[0], color[1], color[2], 1);
        }).toList(),
      );

      return model;

    } catch (e) {
      print('Color error: $e');
    }

    return null;
  }
}

