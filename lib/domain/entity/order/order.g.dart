// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_Order', json, () {
    final val = _$_Order(
      id: $checkedConvert(json, 'id', (v) => v as num),
      name: $checkedConvert(json, 'name', (v) => v as String),
      imageUrl: $checkedConvert(json, 'imageUrl', (v) => v as String),
      status: $checkedConvert(json, 'status', (v) => v as String),
      startTime: $checkedConvert(json, 'start_time', (v) => v as String),
      endTime: $checkedConvert(json, 'end_time', (v) => v as String),
      startAddress: $checkedConvert(json, 'start_address', (v) => v as String),
      endAddress: $checkedConvert(json, 'end_address', (v) => v as String),
      startPhone: $checkedConvert(json, 'start_phone', (v) => v as String),
      endPhone: $checkedConvert(json, 'end_phone', (v) => v as String),
      coast: $checkedConvert(json, 'coast', (v) => v as String),
    );
    return val;
  }, fieldKeyMap: const {
    'startTime': 'start_time',
    'endTime': 'end_time',
    'startAddress': 'start_address',
    'endAddress': 'end_address',
    'startPhone': 'start_phone',
    'endPhone': 'end_phone'
  });
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'start_address': instance.startAddress,
      'end_address': instance.endAddress,
      'start_phone': instance.startPhone,
      'end_phone': instance.endPhone,
      'coast': instance.coast,
    };
