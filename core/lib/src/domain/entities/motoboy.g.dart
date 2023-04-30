// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motoboy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Motoboy _$MotoboyFromJson(Map<String, dynamic> json) => Motoboy(
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$MotoboyToJson(Motoboy instance) => <String, dynamic>{
      'price': instance.price,
      'name': instance.name,
    };
