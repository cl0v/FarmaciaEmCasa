import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../global/domain/entities/drug_entity.dart';
import '../mapper/drug_entity.dart';

class ProductDataSource {
  Future<List<DrugEntity>> fetchDrugs() async{
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();

  return querySnapshot.docs
      .map((doc) => DrugEntityMapper.toDrugEntity(doc.data()))
      .toList();
  }
}