import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

extension FirestoreProductMapper on Product {
  Map<String, dynamic> get withCreationProperties {
    Map<String, dynamic> map = {};
    map['deletedAt'] = null;
    map['createdAt'] = DateTime.now(); // product.createdAt
    map['updatedAt'] = DateTime.now();
    map.addAll(toJson());
    return map;
  }

  Map<String, dynamic> get withUpdatedProperties =>
      toJson()..['updatedAt'] = DateTime.now();

  static Product fromDocumentReference(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data() ?? {};
    return Product.fromJson(data..addAll({"id": doc.id}));
  }
}

