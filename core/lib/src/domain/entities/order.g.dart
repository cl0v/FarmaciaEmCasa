// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String,
      details: (json['details'] as List<dynamic>)
          .map((e) => OrderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      delivery: DeliveryInfo.fromJson(json['delivery'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      canceledAt: DateTime.parse(json['canceledAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'details': instance.details,
      'delivery': instance.delivery,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'canceledAt': instance.canceledAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.delivered: 'delivered',
  OrderStatus.waiting: 'waiting',
  OrderStatus.inCourse: 'inCourse',
};

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
      product: (json['product'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      store: Store.fromJson(json['store'] as Map<String, dynamic>),
      motoboy: Motoboy.fromJson(json['motoboy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'product': instance.product,
      'store': instance.store,
      'motoboy': instance.motoboy,
    };

DeliveryInfo _$DeliveryInfoFromJson(Map<String, dynamic> json) => DeliveryInfo(
      pickupAddress:
          Address.fromJson(json['pickupAddress'] as Map<String, dynamic>),
      deliverToAddress:
          Address.fromJson(json['deliverToAddress'] as Map<String, dynamic>),
      request: $enumDecode(_$OrderDeliveryRequestEnumMap, json['request']),
    );

Map<String, dynamic> _$DeliveryInfoToJson(DeliveryInfo instance) =>
    <String, dynamic>{
      'pickupAddress': instance.pickupAddress,
      'deliverToAddress': instance.deliverToAddress,
      'request': _$OrderDeliveryRequestEnumMap[instance.request]!,
    };

const _$OrderDeliveryRequestEnumMap = {
  OrderDeliveryRequest.entrega: 'entrega',
  OrderDeliveryRequest.retirada: 'retirada',
};
