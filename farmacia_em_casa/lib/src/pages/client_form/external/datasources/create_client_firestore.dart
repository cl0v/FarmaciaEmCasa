import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmacia_em_casa/iugu_env.dart';
import 'package:farmacia_em_casa/src/pages/client_form/domain/entities/client.dart';

abstract class CreateClientFirestoreDataSource {
  Future<String> create(
    String apiIdParam,
    String apiClientId,
    ClientEntity clientEntity,
  );
}

class CreateClientFirestoreDataSourceImpl
    implements CreateClientFirestoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<String> create(
    String apiIdParam,
    String apiClientId,
    ClientEntity clientEntity,
  ) async {
    final result =
        await firestore.collection('clients').add(clientEntity.toJson()
          ..addAll({
            "APIS": {apiIdParam: apiClientId}
          }));
    return result.id;
  }
}
