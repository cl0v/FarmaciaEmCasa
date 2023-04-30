// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      zipCode: json['zip_code'] as String,
      number: json['number'] as String,
      street: json['street'] as String,
      city: json['city'] as String? ?? "Joaíma",
      state: json['state'] as String? ?? "MG",
      district: json['district'] as String,
      complement: json['complement'] as String,
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
