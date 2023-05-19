// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      number: json['number'] as String,
      street: json['street'] as String,
      district: json['district'] as String,
      complement: json['complement'] as String,
      city: json['city'] as String? ?? "Joaíma",
      state: json['state'] as String? ?? "MG",
      zipCode: json['zip_code'] as String? ?? "39890-000",
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'zip_code': instance.zipCode,
      'number': instance.number,
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'district': instance.district,
      'complement': instance.complement,
    };
