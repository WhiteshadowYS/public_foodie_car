import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_catalog/models/interfaces/i_model.dart';

part 'update_token_status_model.g.dart';

// TODO(Yuri): Add comment for this class.
@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class UpdateTokenStatusModel implements IModel {
  @JsonKey(name: 'status', required: false, nullable: true)
  final bool status;

  UpdateTokenStatusModel({
    @required this.status,
  });

  factory UpdateTokenStatusModel.fromJson(json) => _$UpdateTokenStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTokenStatusModelToJson(this);
}
