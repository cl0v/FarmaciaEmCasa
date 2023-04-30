// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientEntity _$ClientEntityFromJson(Map<String, dynamic> json) => ClientEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      phonePrefix: json['phone_prefix'] as String,
      cpfCnpj: json['cpf_cnpj'] as String,
    );

Map<String, dynamic> _$ClientEntityToJson(ClientEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'phone_prefix': instance.phonePrefix,
      'cpf_cnpj': instance.cpfCnpj,
    };
