import 'package:algolia/algolia.dart';

class AlgoliaCredentias {
  static const applicationId = "LECLZ5G6MT";
  static const apiKey = "cb815389e0cb96a4a09d32a23c1e95f8";
}


class AlgoliaApplication {
  static Algolia algolia = const Algolia.init(
    applicationId: AlgoliaCredentias.applicationId,
    apiKey: AlgoliaCredentias.apiKey,
  );
}
