// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  ///CEP. Obrigatório para emissão de boletos registrados
  @JsonKey(name: "zip_code")
  String zipCode;

  /// Número do endereço (obrigatório caso "zip_code" seja enviado).
  String number;

  /// Rua. Obrigatório caso CEP seja incompleto.
  String street;

  /// Default to "Joaíma"
  String city;

  /// Default to MG (Pesquisar se é UF ou o nome completo.)
  String state;

  ///Bairro. Obrigatório caso CEP seja incompleto.
  String district;
  String complement;

  Address({
    required this.number,
    required this.street,
    required this.district,
    required this.complement,
    this.city = "Joaíma",
    this.state = "MG",
    this.zipCode = "39890-000",
  });

  factory Address.empty() {
    return Address(complement: '', district: '', number: '', street: '', zipCode: '');
  }

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
