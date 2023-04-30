// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'motoboy.g.dart';

@JsonSerializable()
class Motoboy {

  double price;
  String name;
  // String CPF
  // Address posicaoNaHoraQueAceitouOPedido.
  
  Motoboy({
    required this.price,
    required this.name,
  });
  

  factory Motoboy.fromJson(Map<String, dynamic> json) =>
      _$MotoboyFromJson(json);
  Map<String, dynamic> toJson() => _$MotoboyToJson(this);
}
