
import 'package:flutter/material.dart';

extension StringToKey on String {
  Key toKey() => Key(this);
}