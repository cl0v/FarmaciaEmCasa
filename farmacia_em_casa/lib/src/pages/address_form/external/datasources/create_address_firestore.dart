import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';


abstract class CreateAddressFirestoreDataSource {
  Future<void> create(String clientId, Address address);
  Future<String> getGatewayApiId(String apiIdParam, String clientId);
}

class CreateAddressFirestoreDataSourceImpl
    implements CreateAddressFirestoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> create(String clientId, Address address) async {
    return firestore
        .collection("clients")
        .doc(clientId)
        .update(address.toJson());
  }

  @override
  Future<String> getGatewayApiId(String apiIdParam, String clientId) async {
    final c = await firestore.collection("clients").doc(clientId).get();
    return c.data()?["APIS"][apiIdParam] ?? "";
  }
}
