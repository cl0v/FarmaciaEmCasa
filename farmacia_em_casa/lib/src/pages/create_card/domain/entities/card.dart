import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class CardDataEntity {

  final String number;
  @JsonKey(name: "month")
  final int expMonth;
  @JsonKey(name: "year")
  final int expYear;
  @JsonKey(name: "verification_value")
  final String cvv;
  @JsonKey(name: "first_name")
  final String firstName;
  @JsonKey(name: "last_name")
  final String lastName;

  CardDataEntity({
    required this.number,
    required this.expMonth,
    required this.expYear,
    required this.cvv,
    required this.firstName,
    required this.lastName,
  });


 factory CardDataEntity.fromJson(Map<String, dynamic> json) => _$CardDataEntityFromJson(json);

  /// Connect the generated [_$CardDataEntityToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CardDataEntityToJson(this);


}
