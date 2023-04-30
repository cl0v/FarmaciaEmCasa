import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

extension FirestoreStoreMapper on Store {
  static Map<String, dynamic> toCreateFirestore(Store store) {
    Map<String, dynamic> map = {};
    map['deletedAt'] = null;
    map['createdAt'] = DateTime.now(); // store.createdAt
    map['updatedAt'] = DateTime.now();
    map.addAll(store.toJson());
    return map;
  }

  static Store fromDocumentReference(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data() ?? {};
    return Store.fromJson(data..addAll({"id": doc.id}));
  }

  static Store fromAlgoliaObjectSnapshot(AlgoliaObjectSnapshot snap){
    Map<String, dynamic> data = snap.data;
    return Store.fromJson(data);
  }
}

