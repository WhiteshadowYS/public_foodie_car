// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'colors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorsModel _$ColorsModelFromJson(Map<String, dynamic> json) {
  return $checkedNew('ColorsModel', json, () {
    final val = ColorsModel(
      background: $checkedConvert(json, 'background', (v) => v as String),
      accentColor: $checkedConvert(json, 'accent_color', (v) => v as String),
      accentFont: $checkedConvert(json, 'accent_font', (v) => v as String),
      buttonFont: $checkedConvert(json, 'button_font', (v) => v as String),
      buttons: $checkedConvert(json, 'buttons', (v) => v as String),
      errorColor: $checkedConvert(json, 'error_color', (v) => v as String),
      font: $checkedConvert(json, 'font', (v) => v as String),
      footerBackground:
          $checkedConvert(json, 'footer_background', (v) => v as String),
      popupText: $checkedConvert(json, 'popup_text', (v) => v as String),
      footerIcons: $checkedConvert(json, 'footer_icons', (v) => v as String),
      footerIconsSelected:
          $checkedConvert(json, 'footer_icons_selected', (v) => v as String),
      minorFont: $checkedConvert(json, 'minor_font', (v) => v as String),
      popupBackground:
          $checkedConvert(json, 'popup_background', (v) => v as String),
      popupCancelButton:
          $checkedConvert(json, 'popup_cancel_button', (v) => v as String),
      popupCloseButton:
          $checkedConvert(json, 'popup_close_button', (v) => v as String),
      popupOkButton:
          $checkedConvert(json, 'popup_ok_button', (v) => v as String),
      primaryColor: $checkedConvert(json, 'primary_color', (v) => v as String),
      brightness: $checkedConvert(json, 'brightness', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'accentColor': 'accent_color',
    'accentFont': 'accent_font',
    'buttonFont': 'button_font',
    'errorColor': 'error_color',
    'footerBackground': 'footer_background',
    'popupText': 'popup_text',
    'footerIcons': 'footer_icons',
    'footerIconsSelected': 'footer_icons_selected',
    'minorFont': 'minor_font',
    'popupBackground': 'popup_background',
    'popupCancelButton': 'popup_cancel_button',
    'popupCloseButton': 'popup_close_button',
    'popupOkButton': 'popup_ok_button',
    'primaryColor': 'primary_color'
  });
}

Map<String, dynamic> _$ColorsModelToJson(ColorsModel instance) =>
    <String, dynamic>{
      'primary_color': instance.primaryColor,
      'accent_color': instance.accentColor,
      'error_color': instance.errorColor,
      'font': instance.font,
      'minor_font': instance.minorFont,
      'background': instance.background,
      'footer_icons': instance.footerIcons,
      'footer_icons_selected': instance.footerIconsSelected,
      'footer_background': instance.footerBackground,
      'button_font': instance.buttonFont,
      'accent_font': instance.accentFont,
      'buttons': instance.buttons,
      'popup_background': instance.popupBackground,
      'popup_text': instance.popupText,
      'popup_close_button': instance.popupCloseButton,
      'popup_ok_button': instance.popupOkButton,
      'popup_cancel_button': instance.popupCancelButton,
      'brightness': instance.brightness,
    };
