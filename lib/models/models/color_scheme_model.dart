import 'package:flutter/material.dart';
import 'package:my_catalog/models/interfaces/i_model.dart';

class ColorSchemeModel implements IModel {
  final List<Color> colors;

  ColorSchemeModel({
    this.colors,
  });
}
