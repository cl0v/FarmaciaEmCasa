import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class ClientEntity {
  @JsonKey(includeToJson: false)
  String id;
  String name;
  String email;
  String phone;
  
  @JsonKey(name: "phone_prefix")
  String phonePrefix;

  @JsonKey(name: "cpf_cnpj")
  String cpfCnpj;

  ClientEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.phonePrefix,
    required this.cpfCnpj,
  });

  factory ClientEntity.empty() {
    return ClientEntity(
      id: "",
      name: "",
      email: "",
      phone: "",
      phonePrefix: "",
      cpfCnpj: "",
    );
  }

  factory ClientEntity.fromJson(Map<String, dynamic> json) => _$ClientEntityFromJson(json);

  /// Connect the generated [_$ClientEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ClientEntityToJson(this);
}
