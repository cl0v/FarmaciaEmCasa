// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as String?,
      name: json['name'] as String,
      address: (json['address'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
      isDeleted: json['isDeleted'] as bool,
      deliveryInfo: StoreDeliveryInfo.fromJson(
          json['deliveryInfo'] as Map<String, dynamic>),
      phone: json['phone'] as String,
      isActive: json['isActive'] as bool,
      operationInfo: StoreOperationTimeInfo.fromJson(
          json['operationInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'deliveryInfo': instance.deliveryInfo,
      'operationInfo': instance.operationInfo,
      'phone': instance.phone,
      'isDeleted': instance.isDeleted,
      'isActive': instance.isActive,
    };

StoreDeliveryInfo _$StoreDeliveryInfoFromJson(Map<String, dynamic> json) =>
    StoreDeliveryInfo(
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$StoreDeliveryInfoToJson(StoreDeliveryInfo instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

StoreOperationTimeInfo _$StoreOperationTimeInfoFromJson(
        Map<String, dynamic> json) =>
    StoreOperationTimeInfo(
      days: (json['days'] as List<dynamic>)
          .map((e) => StoreOperationDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreOperationTimeInfoToJson(
        StoreOperationTimeInfo instance) =>
    <String, dynamic>{
      'days': instance.days,
    };

StoreOperationDay _$StoreOperationDayFromJson(Map<String, dynamic> json) =>
    StoreOperationDay(
      day: json['day'] as int,
      openHour: json['openHour'] as int,
      openMinute: json['openMinute'] as int,
      closeHour: json['closeHour'] as int,
      closeMinute: json['closeMinute'] as int,
    );

Map<String, dynamic> _$StoreOperationDayToJson(StoreOperationDay instance) =>
    <String, dynamic>{
      'day': instance.day,
      'openHour': instance.openHour,
      'openMinute': instance.openMinute,
      'closeHour': instance.closeHour,
      'closeMinute': instance.closeMinute,
    };
