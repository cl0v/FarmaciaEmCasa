import 'package:farmacia_em_casa/iugu_env.dart';

import '../../domain/entities/client.dart';
import '../../external/datasources/create_client_firestore.dart';
import '../../external/datasources/create_client_iugu_api.dart';

abstract class CreateClientRepository {
  Future<String> create(ClientEntity client);
}

class CreateClientRepositoryImpl implements CreateClientRepository{
  final CreateClientIuguAPIDataSource iuguAPIDataSource;
  final CreateClientFirestoreDataSource firestoreDataSource;

  CreateClientRepositoryImpl(this.iuguAPIDataSource, this.firestoreDataSource);
  
  @override
  Future<String> create(client) async{
    final iugu_id = await iuguAPIDataSource.create(client);
    final clientId = await firestoreDataSource.create(IuguEnv.apiId, iugu_id, client);
    return clientId;
  }
 }