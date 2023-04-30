// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  late final String? id;
  final String name;
  final List<Address> address;
  final StoreDeliveryInfo deliveryInfo;
  final StoreOperationTimeInfo operationInfo;
  final String phone;
  final bool isDeleted;

  /// Situação cadastral da loja, [false] caso esteja desativada.
  final bool isActive;

  Store({
    this.id,
    required this.name,
    required this.address,
    required this.isDeleted,
    required this.deliveryInfo,
    required this.phone,
    required this.isActive,
    required this.operationInfo,
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
  final double value;

  StoreDeliveryInfo({
    required this.value,
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
  });

  bool get isOpen {
    final day = days.firstWhere((day) => DateTime.now().weekday == day.day);
    return (day.openHour < DateTime.now().hour) &&
        (day.closeHour < DateTime.now().hour);
  }

  factory StoreOperationTimeInfo.fromJson(Map<String, dynamic> json) => _$StoreOperationTimeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StoreOperationTimeInfoToJson(this);
}

@JsonSerializable()
class StoreOperationDay {
  final int day;
  final int openHour;
  final int openMinute;
  final int closeHour;
  final int closeMinute;

  StoreOperationDay({
    required this.day,
    required this.openHour,
    required this.openMinute,
    required this.closeHour,
    required this.closeMinute,
  });

  factory StoreOperationDay.fromJson(Map<String, dynamic> json) =>
      _$StoreOperationDayFromJson(json);
  Map<String, dynamic> toJson() => _$StoreOperationDayToJson(this);
}
