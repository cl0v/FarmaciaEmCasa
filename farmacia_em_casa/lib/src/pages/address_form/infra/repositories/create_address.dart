import 'package:core/core.dart';

import '../../../../../iugu_env.dart';
import '../../external/datasources/create_address_firestore.dart';
import '../../external/datasources/create_address_iugu_api.dart';

abstract class CreateAddressRepository {
  Future create(String clientId, Address address);
}

class CreateAddressRepositoryImpl implements CreateAddressRepository {
  final CreateAddressIuguAPIDataSource iuguAPIDataSource;
  final CreateAddressFirestoreDataSource firestoreDataSource;

  CreateAddressRepositoryImpl(this.iuguAPIDataSource, this.firestoreDataSource);

  @override
  Future create(clientId, address) async {
    await firestoreDataSource.create(clientId, address);
    final iuguId =
        await firestoreDataSource.getGatewayApiId(IuguEnv.apiId, clientId);
    await iuguAPIDataSource.create(iuguId, address);
  }
}
