
import 'package:algolia/algolia.dart';
import 'package:core/core.dart';

extension AlgoliaProductMapper on Product {
  static Product fromObjectSnapshot(AlgoliaObjectSnapshot snap) {
    Map<String, dynamic> data = snap.data;
    return Product.fromJson(data);
  }
}