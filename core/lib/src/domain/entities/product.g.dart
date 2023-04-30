// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String? ?? "",
      visible: json['visible'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
      prescription: (json['prescription'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      original: json['original'] == null
          ? null
          : Original.fromJson(json['original'] as Map<String, dynamic>),
      brands: (json['brands'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generics: (json['generics'] as List<dynamic>?)
          ?.map((e) => Generic.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: (json['components'] as List<dynamic>?)
              ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      price: json['price'] == null
          ? const Price()
          : Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'prescription': instance.prescription,
      'visible': instance.visible,
      'original': instance.original?.toJson(),
      'generics': instance.generics?.map((e) => e.toJson()).toList(),
      'components': instance.components.map((e) => e.toJson()).toList(),
      'brands': instance.brands,
      'price': instance.price.toJson(),
      'isDeleted': instance.isDeleted,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      units: (json['units'] as List<dynamic>?)
              ?.map((e) => PriceUnit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      formulas: (json['formulas'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => PriceValues.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'units': instance.units.map((e) => e.toJson()).toList(),
      'formulas': instance.formulas,
    };

Original _$OriginalFromJson(Map<String, dynamic> json) => Original(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$OriginalToJson(Original instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Generic _$GenericFromJson(Map<String, dynamic> json) => Generic(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GenericToJson(Generic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      name: json['name'] as String,
      amount: json['amount'] as int,
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };

PriceUnit _$PriceUnitFromJson(Map<String, dynamic> json) => PriceUnit(
      unit: json['unit'] as String,
      values: (json['values'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$PriceUnitToJson(PriceUnit instance) => <String, dynamic>{
      'unit': instance.unit,
      'values': instance.values,
    };

PriceValues _$PriceValuesFromJson(Map<String, dynamic> json) => PriceValues(
      unit1: json['unit1'] as String,
      value1: json['value1'] as num,
      unit2: json['unit2'] as String?,
      value2: json['value2'] as num?,
      priceUnit: json['priceUnit'] as String,
      price: (json['price'] as num).toDouble(),
      storeId: json['storeId'] as String,
    );

Map<String, dynamic> _$PriceValuesToJson(PriceValues instance) =>
    <String, dynamic>{
      'unit1': instance.unit1,
      'value1': instance.value1,
      'unit2': instance.unit2,
      'value2': instance.value2,
      'priceUnit': instance.priceUnit,
      'price': instance.price,
      'storeId': instance.storeId,
    };
