// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

const weekDays = [
  "Sab",
  "Dom",
  "Seg",
  "Ter",
  "Qua",
  "Qui",
  "Sex",
];

@JsonSerializable()
class Store {
  late final String? id;
  final String name;
  final List<Address> address;
  final StoreDeliveryInfo deliveryInfo;
  final StoreOperationTimeInfo operationInfo;
  final String phone;
  final bool isDeleted;

  /// Qualquer nota importante que deve ser tomada.
  final String observation;

  /// Situação cadastral da loja, [false] caso esteja desativada.
  final bool isActive;

  Store({
    this.id,
    required this.name,
    required this.address,
    this.isDeleted = false,
    this.deliveryInfo = const StoreDeliveryInfo(),
    required this.phone,
    required this.isActive,
    required this.operationInfo,
    this.observation = "",
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);
}

enum StoreDeliveryRules {
  /// Valor minimo aceito para seguir a regra.
  minimumValue,
}

@JsonSerializable()
class StoreDeliveryInfo {
  final double? value;

  /// Quando é necessário fornecer motoboy [true]
  final bool needed;

  const StoreDeliveryInfo({
    this.value,
    this.needed = false,
  });
  // final StoreDeliveryRules rules;

  factory StoreDeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$StoreDeliveryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StoreDeliveryInfoToJson(this);
}

@JsonSerializable()
class StoreOperationTimeInfo {
  final List<StoreOperationDay> days;

  StoreOperationTimeInfo({
    required this.days,
  }) : assert(days.isNotEmpty);

  bool get isOpen {
    final day = days.firstWhere((day) => DateTime.now().weekday == day.day);

    final openHour = int.parse(day.open.split(":")[0]);
    final closeHour = int.parse(day.close.split(":")[0]);
    return (openHour < DateTime.now().hour) &&
        (closeHour < DateTime.now().hour);
  }

  factory StoreOperationTimeInfo.fromJson(Map<String, dynamic> json) =>
      _$StoreOperationTimeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StoreOperationTimeInfoToJson(this);
}

@JsonSerializable()
class StoreOperationDay {
  String day;
  String open;
  String close;

  StoreOperationDay({
    required this.day,
    this.open = "07:00",
    this.close = "20:00",
  });

  factory StoreOperationDay.fromJson(Map<String, dynamic> json) =>
      _$StoreOperationDayFromJson(json);
  Map<String, dynamic> toJson() => _$StoreOperationDayToJson(this);
}
