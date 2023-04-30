import '../../../../global/domain/entities/drug_entity.dart';

class DrugEntityMapper {
  static DrugEntity toDrugEntity(Map<String, dynamic> map) {
  return DrugEntity.usageList(
    map['name'],
    map['price'].toDouble(),
    map['use'].cast<String>(),
    map['description'],
  );
}
}