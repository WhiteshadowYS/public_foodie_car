// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gdr_colors_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GDRColorsDto _$GDRColorsDtoFromJson(Map<String, dynamic> json) {
  return $checkedNew('GDRColorsDto', json, () {
    final val = GDRColorsDto(
      primaryColor: $checkedConvert(json, 'primary_color', (v) => v as String),
      accentColor: $checkedConvert(json, 'accent_color', (v) => v as String),
      errorColor: $checkedConvert(json, 'error_color', (v) => v as String),
      minorFont: $checkedConvert(json, 'minor_font', (v) => v as String),
      buttonFont: $checkedConvert(json, 'button_font', (v) => v as String),
      accentFont: $checkedConvert(json, 'accent_font', (v) => v as String),
      font: $checkedConvert(json, 'font', (v) => v as String),
      background: $checkedConvert(json, 'background', (v) => v as String),
      buttons: $checkedConvert(json, 'buttons', (v) => v as String),
      footerBackground:
          $checkedConvert(json, 'footer_background', (v) => v as String),
      footerFont: $checkedConvert(json, 'footer_font', (v) => v as String),
      footerIcons: $checkedConvert(json, 'footer_icons', (v) => v as String),
      footerIconsSelected:
          $checkedConvert(json, 'footer_icons_selected', (v) => v as String),
      popupBackground:
          $checkedConvert(json, 'popup_background', (v) => v as String),
      popupCancelButton:
          $checkedConvert(json, 'popup_cancel_button', (v) => v as String),
      popupCloseButton:
          $checkedConvert(json, 'popup_close_button', (v) => v as String),
      popupOkButton:
          $checkedConvert(json, 'popup_ok_button', (v) => v as String),
      popupText: $checkedConvert(json, 'popup_text', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'primaryColor': 'primary_color',
    'accentColor': 'accent_color',
    'errorColor': 'error_color',
    'minorFont': 'minor_font',
    'buttonFont': 'button_font',
    'accentFont': 'accent_font',
    'footerBackground': 'footer_background',
    'footerFont': 'footer_font',
    'footerIcons': 'footer_icons',
    'footerIconsSelected': 'footer_icons_selected',
    'popupBackground': 'popup_background',
    'popupCancelButton': 'popup_cancel_button',
    'popupCloseButton': 'popup_close_button',
    'popupOkButton': 'popup_ok_button',
    'popupText': 'popup_text'
  });
}

Map<String, dynamic> _$GDRColorsDtoToJson(GDRColorsDto instance) =>
    <String, dynamic>{
      'primary_color': instance.primaryColor,
      'accent_color': instance.accentColor,
      'error_color': instance.errorColor,
      'minor_font': instance.minorFont,
      'button_font': instance.buttonFont,
      'accent_font': instance.accentFont,
      'font': instance.font,
      'background': instance.background,
      'footer_icons': instance.footerIcons,
      'footer_icons_selected': instance.footerIconsSelected,
      'footer_background': instance.footerBackground,
      'footer_font': instance.footerFont,
      'buttons': instance.buttons,
      'popup_background': instance.popupBackground,
      'popup_text': instance.popupText,
      'popup_close_button': instance.popupCloseButton,
      'popup_ok_button': instance.popupOkButton,
      'popup_cancel_button': instance.popupCancelButton,
    };
