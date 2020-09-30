import 'package:flutter/cupertino.dart';
import 'package:my_catalog/models/interfaces/i_model.dart';

class StorageModel implements IModel {
  final String text;

  StorageModel({
    @required this.text,
  });

  factory StorageModel.fromMap(Map<String, dynamic> map) {
    return StorageModel(
      text: map['text'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
    };
  }
}
