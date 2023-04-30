import 'package:adm/credentials.dart';
import 'package:algolia/algolia.dart';
import 'package:core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../_infra/datasources/stores.dart';
import '../mappers/firestore_algolia.dart';

class FirestorAlgoliaeStoreDataSourceImpl implements StoresDataSource {
  final firestore = FirebaseFirestore.instance;
  final Algolia algolia = AlgoliaApplication.algolia;
  static String collection = kDebugMode ? 'dev_stores' : 'stores';
  static String index = kDebugMode ? 'dev_stores' : 'stores';

  @override
  Future<String> create(Store store) async {
    final doc = await firestore
        .collection(collection)
        .add(FirestoreStoreMapper.toCreateFirestore(store));
    await algolia.index(index).addObject(
        FirestoreStoreMapper.toCreateFirestore(store)..['firestoreRefId'] = doc.id);

    return doc.id;
  }

  @override
  Future<List<Store>> fetchAll() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection(collection).get();

    return querySnapshot.docs
        .map<Store>(FirestoreStoreMapper.fromDocumentReference)
        .toList();
  }

  @override
  Future<Store> fetchById(String id) async {
    final ref = await firestore.collection(collection).doc(id).get();
    return FirestoreStoreMapper.fromDocumentReference(ref);
  }

  @override
  Future<List<Store>> searchByName(String name) async {
    var query = algolia.instance.index(index).query(name);
    query = query.facetFilter('isDeleted:false');
    var snap = await query.getObjects();

    return snap.hits
        .map<Store>(FirestoreStoreMapper.fromAlgoliaObjectSnapshot)
        .toList();
  }

  @override
  Future<String> update(Store store) async {
    algolia.index(index).batch().partialUpdateObject(store.toJson());
    await firestore
        .collection(collection)
        .doc(store.id)
        .set(store.toJson(), SetOptions(merge: true));
    return store.id!;
  }
}
