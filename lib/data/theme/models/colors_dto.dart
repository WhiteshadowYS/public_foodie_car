import 'package:json_annotation/json_annotation.dart';

part 'colors_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  checked: true,
  explicitToJson: true,
)
class ColorsDTO {
  String primaryColor;
  String accentColor;
  String errorColor;

  String font;
  String minorFont;
  String accentFont;
  String background;
  String footerIcons;
  String footerIconsSelected;
  String footerBackground;
  String buttonFont;
  String buttons;
  String popupBackground;
  String popupText;
  String popupCloseButton;
  String popupOkButton;
  String popupCancelButton;

  ColorsDTO({
    this.primaryColor,
    this.accentColor,
    this.errorColor,
    this.font,
    this.minorFont,
    this.accentFont,
    this.background,
    this.footerIcons,
    this.footerIconsSelected,
    this.footerBackground,
    this.buttonFont,
    this.buttons,
    this.popupBackground,
    this.popupText,
    this.popupCloseButton,
    this.popupOkButton,
    this.popupCancelButton,
  });

  factory ColorsDTO.fromJson(json) => _$ColorsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsDTOToJson(this);
}
