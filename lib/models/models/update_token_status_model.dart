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
/// The class [UpdateTokenStatusModel] is a model that stores data about the [UpdateTokenStatusModel].
/// Assigning the class [UpdateTokenStatusModel] - update the application token.
/// For this class, [JsonSerializable] was applied, to work with json.
/// Class [UpdateTokenStatusModel], implements from the abstract class [IDto].
/// The [UpdateTokenStatusModel] class has 1 variables, [status].
/// In the [status] variable, transmits the token update status.
class UpdateTokenStatusModel implements IModel {
  @JsonKey(name: 'status', required: false, nullable: true)
  final String status;

  UpdateTokenStatusModel({
    @required this.status,
  });

  /// Also the class [UpdateTokenStatusModel], has [fromJson] and [toJson] to work with the json format.
  /// [UpdateTokenStatusModel], creates a new exemplar [UpdateTokenStatusModel], based on json.
  factory UpdateTokenStatusModel.fromJson(json) => _$UpdateTokenStatusModelFromJson(json);

  /// [toJson], creates a new json from the exemplary of the class [UpdateTokenStatusModel].
  Map<String, dynamic> toJson() => _$UpdateTokenStatusModelToJson(this);
}
