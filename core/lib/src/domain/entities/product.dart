import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
class Product {
  @JsonKey(includeToJson: false)
  late final String? id;

  final String name;
  final String description;
  final List<String> prescription;
  final bool visible;
  final Original? original;
  final List<Generic>? generics;
  final List<Component> components;
  final List<String> brands;
  final Price price;
  final bool isDeleted;

  /// Sempre que o campo [original] for null, o medicamento é original.
  bool get isGeneric => original != null;

  Product({
    this.id,
    required this.name,
    this.description = "",
    this.visible = false,
    this.isDeleted = false,
    this.prescription = const [],
    this.original,
    this.brands = const [],
    this.generics,
    this.components = const [],
    this.price = const Price(),
  }) : assert((generics != null && original == null) ||
            (generics == null && original != null));

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Price {
  @JsonKey(includeToJson: false, defaultValue: [])
  final List<PriceValues>? values;
  final List<PriceUnit> units;
  final List<String> formulas;

  const Price({
    this.units = const [],
    this.formulas = const [],
    this.values,
  });

  double get lowestPrice {
    double value = 0;
    values?.forEach((element) {
      if (value > element.price) {
        value = element.price;
      }
    });
    return value;
  }

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}

@JsonSerializable()
class Original {
  final String id;
  final String name;

  factory Original.fromJson(Map<String, dynamic> json) =>
      _$OriginalFromJson(json);

  Original(this.id, this.name);
  Map<String, dynamic> toJson() => _$OriginalToJson(this);
}

@JsonSerializable()
class Generic {
  final String id;
  final String name;
  Generic({
    required this.id,
    required this.name,
  });
  factory Generic.fromJson(Map<String, dynamic> json) =>
      _$GenericFromJson(json);
  Map<String, dynamic> toJson() => _$GenericToJson(this);
}

@JsonSerializable()
class Component {
  final String name;
  final int amount;
  final String unit;
  Component({
    required this.name,
    required this.amount,
    required this.unit,
  });
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}

@JsonSerializable()
class PriceUnit {
  final String unit;
  final List<int> values;

  PriceUnit({
    required this.unit,
    required this.values,
  });

  factory PriceUnit.fromJson(Map<String, dynamic> json) =>
      _$PriceUnitFromJson(json);
  Map<String, dynamic> toJson() => _$PriceUnitToJson(this);
}

@JsonSerializable()
class PriceValues {
  final String unit1;
  final num value1;
  final String? unit2;
  final num? value2;
  final String priceUnit;
  final double price;
  final String storeId;

  PriceValues({
    required this.unit1,
    required this.value1,
    this.unit2,
    this.value2,
    required this.priceUnit,
    required this.price,
    required this.storeId,
  });

  Map<String, dynamic> get _jsonExample => {
        "unit1": "g",
        "unit2": "comp",
        "priceUnit": "real",
        "price": 30.50,
        "value1": 1,
        "value2": 30,
        "storeId": "refId"
      };

  factory PriceValues.fromJson(Map<String, dynamic> json) =>
      _$PriceValuesFromJson(json);

  Map<String, dynamic> toJson() => _$PriceValuesToJson(this);
}
