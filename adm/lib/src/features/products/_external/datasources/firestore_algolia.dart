import 'package:adm/credentials.dart';
import 'package:algolia/algolia.dart';
import 'package:core/core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../../_infra/datasources/products.dart';
import '../mappers/algolia.dart';
import '../mappers/firestore.dart';

class FirestoreProductDataSourceImpl implements ProductsDataSource {
  final firestore = FirebaseFirestore.instance;
  final Algolia algolia = AlgoliaApplication.algolia;
  static String collection = kDebugMode ? 'dev_products' : 'products';
  static String index = kDebugMode ? 'dev_products' : 'products';

  @override
  Future<String> create(Product product) async {
    final map = product.withCreationProperties;
    final doc = await firestore.collection(collection).add(map);
    await algolia.index(index).addObject(map..['firestoreRefId'] = doc.id);

    return doc.id;
  }

  @override
  Future<List<Product>> fetchAll() async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection(collection).get();

    return querySnapshot.docs
        .map<Product>(FirestoreProductMapper.fromDocumentReference)
        .toList();
  }

  @override
  Future<Product> fetchById(String id) async {
    final ref = await firestore.collection(collection).doc(id).get();
    return FirestoreProductMapper.fromDocumentReference(ref);
  }

  @override
  Future<List<Product>> search(String search) async {
    var query = algolia.instance.index(index).query(search);
    
    query = query.facetFilter('isDeleted:false');
    var snap = await query.getObjects();

    return snap.hits
        .map<Product>(AlgoliaProductMapper.fromObjectSnapshot)
        .toList();
  }

  @override
  Future<String> update(Product product) async {
    final map = product.withUpdatedProperties;

    algolia.index(index).batch().partialUpdateObject(map);

    await firestore
        .collection(collection)
        .doc(product.id)
        .set(map, SetOptions(merge: true));
    return product.id!;
  }
}
