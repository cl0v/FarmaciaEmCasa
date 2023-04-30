// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDataEntity _$CardDataEntityFromJson(Map<String, dynamic> json) =>
    CardDataEntity(
      number: json['number'] as String,
      expMonth: json['month'] as int,
      expYear: json['year'] as int,
      cvv: json['verification_value'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );

Map<String, dynamic> _$CardDataEntityToJson(CardDataEntity instance) =>
    <String, dynamic>{
      'number': instance.number,
      'month': instance.expMonth,
      'year': instance.expYear,
      'verification_value': instance.cvv,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
