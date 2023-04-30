// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'motoboy.dart';
import 'product.dart';
import 'store.dart';

part 'order.g.dart';

/// Como deverá ser feita a entrega do pedido.///////////////
enum OrderDeliveryRequest {
  /// User recebe o produto em casa.
  entrega,

  /// User vai na farmácia buscar o medicamento.
  retirada,
}

enum OrderStatus {
  delivered,
  waiting,
  inCourse,
}

@JsonSerializable()
class Order {
  late final String id;
  List<OrderDetails> details;
  DeliveryInfo delivery;
  OrderStatus status;
  DateTime createdAt;

  /// Horario de cancelamento do pedido.
  /// Não existe deletedAt, pois uma ordem jamais pode ser deletada;
  /// DateTime deletedAt. // instead, use canceledAt
  DateTime canceledAt;
  DateTime updatedAt;

  Order({
    required this.id,
    required this.details,
    required this.delivery,
    required this.status,
    required this.createdAt,
    required this.canceledAt,
    required this.updatedAt,
  });

  /// Facilitador que calcula o valor total do pedido;
  double get total {
    double t = 0;
    for (var d in details) {
      for (var p in d.product) {
        t += p.price.lowestPrice;
      }
    }
    return t;
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderDetails {
  // @JsonKey(toJson: _toJsonProducts)
  List<Product> product; // Apenas os dados essenciais.
  Store store;
  Motoboy motoboy;

  OrderDetails({
    required this.product,
    required this.store,
    required this.motoboy,
  });

  final example = [
    {
      "product": {"name": "Ibup", "id": "idDoIbup", "price": 30.50},
      "store": {"id": "idStore", "address": {}},
      "motoboy": {"name" : "Udienio", "price": 4.00}
    }
  ];

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class DeliveryInfo {
  Address pickupAddress;
  Address deliverToAddress;
  OrderDeliveryRequest request;

  DeliveryInfo({
    required this.pickupAddress,
    required this.deliverToAddress,
    required this.request,
  });

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) =>
      _$DeliveryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryInfoToJson(this);
}
